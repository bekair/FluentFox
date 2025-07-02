'use client';

import { Container, Typography, Button, Box, Stack, Card, CardContent, IconButton, Chip, Alert } from '@mui/material';
import { 
  Home as HomeIcon, 
  Code as CodeIcon, 
  LightMode as LightModeIcon, 
  DarkMode as DarkModeIcon,
  Palette as PaletteIcon
} from '@mui/icons-material';
import { useTheme } from '@/theme/ThemeProvider';

export default function Home() {
  const { mode, toggleTheme } = useTheme();

  return (
    <Container maxWidth="md" sx={{ py: 8 }}>
      <Box sx={{ textAlign: 'center', mb: 6 }}>
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 4 }}>
          <Typography variant="h2" component="h1" sx={{ fontWeight: 300, flex: 1 }}>
            FluentFox
          </Typography>
          <IconButton 
            onClick={toggleTheme} 
            size="large" 
            color="primary"
            sx={{ 
              border: 1, 
              borderColor: 'primary.main',
              '&:hover': {
                backgroundColor: 'primary.main',
                color: 'primary.contrastText'
              }
            }}
          >
            {mode === 'light' ? <DarkModeIcon /> : <LightModeIcon />}
          </IconButton>
        </Box>
        
        <Stack direction="row" spacing={1} justifyContent="center" sx={{ mb: 2 }}>
          <Chip 
            icon={<PaletteIcon />} 
            label={`${mode} mode`} 
            color="primary" 
            variant="outlined" 
          />
          <Chip label="Next.js 15" color="secondary" />
          <Chip label="Material-UI v7" color="success" />
          <Chip label="TypeScript" color="info" />
        </Stack>
        
        <Typography variant="h5" component="h2" gutterBottom sx={{ fontWeight: 400, color: 'text.secondary' }}>
          Next.js + Material-UI + Roboto Font
        </Typography>
        <Typography variant="body1" sx={{ mt: 2, mb: 4 }}>
          This is a test page to verify that Material-UI components and Roboto font are working correctly.
          The text you're reading should be displayed in the Roboto font family.
        </Typography>
        
        <Alert severity="success" sx={{ mb: 4 }}>
          ✨ Theme system is working! Click the theme toggle button to switch between light and dark modes.
        </Alert>
      </Box>
      
      <Stack spacing={4} sx={{ mb: 6 }}>
        <Card elevation={2}>
          <CardContent>
            <Typography variant="h4" gutterBottom sx={{ fontWeight: 500, color: 'primary.main' }}>
              🎨 Theme Colors
            </Typography>
            <Stack direction="row" spacing={2} flexWrap="wrap" useFlexGap>
              <Chip label="Primary" color="primary" />
              <Chip label="Secondary" color="secondary" />
              <Chip label="Success" color="success" />
              <Chip label="Error" color="error" />
              <Chip label="Warning" color="warning" />
              <Chip label="Info" color="info" />
            </Stack>
          </CardContent>
        </Card>
        
        <Card elevation={2}>
          <CardContent>
            <Typography variant="h4" gutterBottom sx={{ fontWeight: 500, color: 'secondary.main' }}>
              📝 Typography Examples
            </Typography>
            <Stack spacing={2}>
              <Typography variant="h1">Heading 1 - Roboto Light</Typography>
              <Typography variant="h2">Heading 2 - Roboto Light</Typography>
              <Typography variant="h3">Heading 3 - Roboto Regular</Typography>
              <Typography variant="h4">Heading 4 - Roboto Regular</Typography>
              <Typography variant="h5">Heading 5 - Roboto Regular</Typography>
              <Typography variant="h6">Heading 6 - Roboto Medium</Typography>
              <Typography variant="subtitle1">Subtitle 1 - Roboto Regular</Typography>
              <Typography variant="subtitle2">Subtitle 2 - Roboto Medium</Typography>
              <Typography variant="body1">Body 1 - Roboto Regular</Typography>
              <Typography variant="body2">Body 2 - Roboto Regular</Typography>
              <Typography variant="caption">Caption - Roboto Regular</Typography>
              <Typography variant="overline">Overline - Roboto Regular</Typography>
            </Stack>
          </CardContent>
        </Card>
        
        <Card elevation={2}>
          <CardContent>
            <Typography variant="h4" gutterBottom sx={{ fontWeight: 500, color: 'success.main' }}>
              ⚖️ Font Weight Examples
            </Typography>
            <Stack spacing={2}>
              <Typography variant="body1" sx={{ fontWeight: 300 }}>
                Roboto Light (300) - The quick brown fox jumps over the lazy dog
              </Typography>
              <Typography variant="body1" sx={{ fontWeight: 400 }}>
                Roboto Regular (400) - The quick brown fox jumps over the lazy dog
              </Typography>
              <Typography variant="body1" sx={{ fontWeight: 500 }}>
                Roboto Medium (500) - The quick brown fox jumps over the lazy dog
              </Typography>
              <Typography variant="body1" sx={{ fontWeight: 700 }}>
                Roboto Bold (700) - The quick brown fox jumps over the lazy dog
              </Typography>
            </Stack>
          </CardContent>
        </Card>
      </Stack>

      <Box sx={{ textAlign: 'center' }}>
        <Stack direction={{ xs: 'column', sm: 'row' }} spacing={2} justifyContent="center">
          <Button 
            variant="contained" 
            startIcon={<HomeIcon />}
            size="large"
          >
            Material-UI Button
          </Button>
          <Button 
            variant="outlined" 
            startIcon={<CodeIcon />}
            size="large"
          >
            Get Started
          </Button>
        </Stack>
      </Box>
    </Container>
  );
}
