Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5B416101F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 11:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgBQKdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 05:33:00 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:59432 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgBQKdA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 05:33:00 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 3mYy2200L5USYZQ01mYyhb; Mon, 17 Feb 2020 11:32:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3dhy-00045X-OO; Mon, 17 Feb 2020 11:32:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3dhy-0001Mo-MD; Mon, 17 Feb 2020 11:32:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable additional support for Renesas platforms
Date:   Mon, 17 Feb 2020 11:32:51 +0100
Message-Id: <20200217103251.5205-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for more hardware
present on Renesas SoCs and boards:
  - R-Car CAN and CAN-FD controllers,
  - MSIOF SPI controllers,
  - ROHM BD9571 GPIO support,
  - R-Car MIPI CSI-2 receivers,
  - R-Car Video Input,
  - Renesas Fine Display Processors,
  - Renesas Digital Radio Interfaces,
  - R-Car Gen3 internal HDMI encoders,
  - Generic LVDS panel support,
  - Dumb VGA DAC Bridge support,
  - Thine THC63LVD1024 LVDS decoder bridges,
  - Synopsys Designware AHB Audio and CEC interfaces,
  - Renesas USBHS HCD support,
  - IDT VersaClock 5,6 devices,
  - Maxim max9611/max9612 ADCs,
  - ARM TrustZone CryptoCell security processors.

All of the above are modular, except for the VC5 clock driver, and the
SDR config gatekeepers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.7.
---
 arch/arm64/configs/defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 51b8b8555a6e4065..49053323323fe68b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -161,6 +161,9 @@ CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
 CONFIG_QRTR_TUN=m
 CONFIG_BPF_JIT=y
+CONFIG_CAN=m
+CONFIG_CAN_RCAR=m
+CONFIG_CAN_RCAR_CANFD=m
 CONFIG_BT=m
 CONFIG_BT_HIDP=m
 # CONFIG_BT_HS is not set
@@ -399,6 +402,7 @@ CONFIG_SPI_QCOM_QSPI=m
 CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
+CONFIG_SPI_SH_MSIOF=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
@@ -432,6 +436,7 @@ CONFIG_GPIO_XGENE_SB=y
 CONFIG_GPIO_MAX732X=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
+CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
 CONFIG_QCOM_CPR=y
@@ -516,19 +521,25 @@ CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
 CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
+CONFIG_MEDIA_SDR_SUPPORT=y
 CONFIG_MEDIA_CONTROLLER=y
 CONFIG_VIDEO_V4L2_SUBDEV_API=y
 # CONFIG_DVB_NET is not set
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_RCAR_CSI2=m
+CONFIG_VIDEO_RCAR_VIN=m
 CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
+CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_SDR_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
@@ -546,15 +557,21 @@ CONFIG_ROCKCHIP_DW_HDMI=y
 CONFIG_ROCKCHIP_DW_MIPI_DSI=y
 CONFIG_ROCKCHIP_INNO_HDMI=y
 CONFIG_DRM_RCAR_DU=m
+CONFIG_DRM_RCAR_DW_HDMI=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_SUN8I_DW_HDMI=m
 CONFIG_DRM_SUN8I_MIXER=m
 CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
+CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_DUMB_VGA_DAC=m
 CONFIG_DRM_SII902X=m
+CONFIG_DRM_THINE_THC63LVD1024=m
 CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
+CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_VC4=m
 CONFIG_DRM_ETNAVIV=m
 CONFIG_DRM_HISI_HIBMC=m
@@ -605,6 +622,7 @@ CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_EXYNOS=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_MUSB_HDRC=y
@@ -712,6 +730,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RASPBERRYPI=m
 CONFIG_CLK_IMX8MM=y
 CONFIG_CLK_IMX8MN=y
@@ -792,6 +811,7 @@ CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
+CONFIG_MAX9611=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
@@ -885,6 +905,7 @@ CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_DEV_QCOM_RNG=m
+CONFIG_CRYPTO_DEV_CCREE=m
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
-- 
2.17.1

