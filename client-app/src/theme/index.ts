import { createTheme, ThemeOptions } from '@mui/material/styles';
import { lightPalette, darkPalette } from './palette';
import { typography } from './typography';

export const lightTheme: ThemeOptions = createTheme({
  palette: lightPalette,
  typography,
});

export const darkTheme: ThemeOptions = createTheme({
  palette: darkPalette,
  typography,
});
