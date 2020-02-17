Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9E2161258
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 13:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgBQMv3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 07:51:29 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33171 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgBQMv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 07:51:28 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so18743309lji.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2020 04:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p7FyknOVWX4R66SQBUeluzCkbXYT5k3MWupHr8k4D/8=;
        b=XJTQskTtjB9nRx0EqNx0e1ef/CbZIlzPBT3l2uJDbVpIDl7JcA3woZYVlHUethVpDH
         YbTL2ncyQtSaEwj1AUz98VE0quMA2gR64qDB6Sfdmax/UgGFyadIQcx/kDPNudVtXoIc
         Tro5D65MrhYZ6ph6ggmoFe0yeouvCrc57EN6Lf9vjACarrg9mFXnSTahJugL5Ekg3znK
         WO9pkYrxSZkwHZfrJWL8rJNDEDJ/RR+3tKRILNjlSte6PoHdHYuhrJlcK/MVaKgerDPR
         1MJtoKXnq3KVUZwJHBvdLaG7mRR3FlNb/Cem+SUrVCjV9D9YHg/V6CjCpYpiq06A62Sj
         iM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p7FyknOVWX4R66SQBUeluzCkbXYT5k3MWupHr8k4D/8=;
        b=YvyGiw1KRbpUCFpp3qPcvh5N9T6LzGMduAE8MjQmE+MOQgQuyMxDZ9hPOSztoTT5Ia
         3/bClDvUhQHuopkXodmhx/pGROVtXtPNooUZK2zLKLtKU4sOClw49GpOnv2vAb5pCxXy
         wT09/vUZXE2vnV3NnHsL138o2X9mZBIvsRddTSSsZzj3MxTlD7RhXHSnYLC7Xo3+cAX3
         5yCQ+OzZGHVoSgKEvW+sHb7lkYiOZCgg3pvOzeGOpLYhl0CcyHTgbvq2zIjiBkCjRZtJ
         Qc1CAs+ihlYWb6kHv2Wx35rRheiAQYkoahzZBqHBlP96kidQQrthRipX55n0PmO1Ns24
         O9Yw==
X-Gm-Message-State: APjAAAWxj3kppy4U6AM9ltYub2r/0LApdhAKCJldx898OcugVQf5FiJr
        4Bt1/QTSSGgj3sk4AzDhgDTz9g==
X-Google-Smtp-Source: APXvYqxzNR3oKfgSKx256hPNVC4uZ8AYONQFRUjzyGqicN8jQhPOemT9wO+bN2D3q646sS/kUsDJag==
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr9246844lja.131.1581943885970;
        Mon, 17 Feb 2020 04:51:25 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id k25sm353697lji.42.2020.02.17.04.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 04:51:25 -0800 (PST)
Date:   Mon, 17 Feb 2020 13:51:25 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable additional support for Renesas
 platforms
Message-ID: <20200217125125.GW3013231@oden.dyn.berto.se>
References: <20200217103251.5205-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200217103251.5205-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-17 11:32:51 +0100, Geert Uytterhoeven wrote:
> Increase build and test coverage by enabling support for more hardware
> present on Renesas SoCs and boards:
>   - R-Car CAN and CAN-FD controllers,
>   - MSIOF SPI controllers,
>   - ROHM BD9571 GPIO support,
>   - R-Car MIPI CSI-2 receivers,
>   - R-Car Video Input,

For VIN and CSI-2,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>   - Renesas Fine Display Processors,
>   - Renesas Digital Radio Interfaces,
>   - R-Car Gen3 internal HDMI encoders,
>   - Generic LVDS panel support,
>   - Dumb VGA DAC Bridge support,
>   - Thine THC63LVD1024 LVDS decoder bridges,
>   - Synopsys Designware AHB Audio and CEC interfaces,
>   - Renesas USBHS HCD support,
>   - IDT VersaClock 5,6 devices,
>   - Maxim max9611/max9612 ADCs,
>   - ARM TrustZone CryptoCell security processors.
> 
> All of the above are modular, except for the VC5 clock driver, and the
> SDR config gatekeepers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v5.7.
> ---
>  arch/arm64/configs/defconfig | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 51b8b8555a6e4065..49053323323fe68b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -161,6 +161,9 @@ CONFIG_QRTR=m
>  CONFIG_QRTR_SMD=m
>  CONFIG_QRTR_TUN=m
>  CONFIG_BPF_JIT=y
> +CONFIG_CAN=m
> +CONFIG_CAN_RCAR=m
> +CONFIG_CAN_RCAR_CANFD=m
>  CONFIG_BT=m
>  CONFIG_BT_HIDP=m
>  # CONFIG_BT_HS is not set
> @@ -399,6 +402,7 @@ CONFIG_SPI_QCOM_QSPI=m
>  CONFIG_SPI_QUP=y
>  CONFIG_SPI_QCOM_GENI=m
>  CONFIG_SPI_S3C64XX=y
> +CONFIG_SPI_SH_MSIOF=m
>  CONFIG_SPI_SUN6I=y
>  CONFIG_SPI_SPIDEV=m
>  CONFIG_SPMI=y
> @@ -432,6 +436,7 @@ CONFIG_GPIO_XGENE_SB=y
>  CONFIG_GPIO_MAX732X=y
>  CONFIG_GPIO_PCA953X=y
>  CONFIG_GPIO_PCA953X_IRQ=y
> +CONFIG_GPIO_BD9571MWV=m
>  CONFIG_GPIO_MAX77620=y
>  CONFIG_POWER_AVS=y
>  CONFIG_QCOM_CPR=y
> @@ -516,19 +521,25 @@ CONFIG_MEDIA_SUPPORT=m
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
>  CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
>  CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> +CONFIG_MEDIA_SDR_SUPPORT=y
>  CONFIG_MEDIA_CONTROLLER=y
>  CONFIG_VIDEO_V4L2_SUBDEV_API=y
>  # CONFIG_DVB_NET is not set
>  CONFIG_MEDIA_USB_SUPPORT=y
>  CONFIG_USB_VIDEO_CLASS=m
>  CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_RCAR_CSI2=m
> +CONFIG_VIDEO_RCAR_VIN=m
>  CONFIG_VIDEO_SUN6I_CSI=m
>  CONFIG_V4L_MEM2MEM_DRIVERS=y
>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
>  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
> +CONFIG_VIDEO_RENESAS_FDP1=m
>  CONFIG_VIDEO_RENESAS_FCP=m
>  CONFIG_VIDEO_RENESAS_VSP1=m
> +CONFIG_SDR_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_RCAR_DRIF=m
>  CONFIG_DRM=m
>  CONFIG_DRM_I2C_NXP_TDA998X=m
>  CONFIG_DRM_NOUVEAU=m
> @@ -546,15 +557,21 @@ CONFIG_ROCKCHIP_DW_HDMI=y
>  CONFIG_ROCKCHIP_DW_MIPI_DSI=y
>  CONFIG_ROCKCHIP_INNO_HDMI=y
>  CONFIG_DRM_RCAR_DU=m
> +CONFIG_DRM_RCAR_DW_HDMI=m
>  CONFIG_DRM_SUN4I=m
>  CONFIG_DRM_SUN8I_DW_HDMI=m
>  CONFIG_DRM_SUN8I_MIXER=m
>  CONFIG_DRM_MSM=m
>  CONFIG_DRM_TEGRA=m
> +CONFIG_DRM_PANEL_LVDS=m
>  CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_DUMB_VGA_DAC=m
>  CONFIG_DRM_SII902X=m
> +CONFIG_DRM_THINE_THC63LVD1024=m
>  CONFIG_DRM_TI_SN65DSI86=m
>  CONFIG_DRM_I2C_ADV7511=m
> +CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
> +CONFIG_DRM_DW_HDMI_CEC=m
>  CONFIG_DRM_VC4=m
>  CONFIG_DRM_ETNAVIV=m
>  CONFIG_DRM_HISI_HIBMC=m
> @@ -605,6 +622,7 @@ CONFIG_USB_EHCI_HCD_PLATFORM=y
>  CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_EXYNOS=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_RENESAS_USBHS_HCD=m
>  CONFIG_USB_RENESAS_USBHS=m
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_MUSB_HDRC=y
> @@ -712,6 +730,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
>  CONFIG_COMMON_CLK_S2MPS11=y
>  CONFIG_CLK_QORIQ=y
>  CONFIG_COMMON_CLK_PWM=y
> +CONFIG_COMMON_CLK_VC5=y
>  CONFIG_CLK_RASPBERRYPI=m
>  CONFIG_CLK_IMX8MM=y
>  CONFIG_CLK_IMX8MN=y
> @@ -792,6 +811,7 @@ CONFIG_EXTCON_USBC_CROS_EC=y
>  CONFIG_MEMORY=y
>  CONFIG_IIO=y
>  CONFIG_EXYNOS_ADC=y
> +CONFIG_MAX9611=m
>  CONFIG_QCOM_SPMI_ADC5=m
>  CONFIG_ROCKCHIP_SARADC=m
>  CONFIG_IIO_CROS_EC_SENSORS_CORE=m
> @@ -885,6 +905,7 @@ CONFIG_CRYPTO_DEV_FSL_CAAM=m
>  CONFIG_CRYPTO_DEV_HISI_ZIP=m
>  CONFIG_CRYPTO_USER_API_RNG=m
>  CONFIG_CRYPTO_DEV_QCOM_RNG=m
> +CONFIG_CRYPTO_DEV_CCREE=m
>  CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_INFO=y
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
