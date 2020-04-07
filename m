Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE41A111E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2020 18:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgDGQVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Apr 2020 12:21:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43440 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgDGQVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Apr 2020 12:21:07 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECAE659E;
        Tue,  7 Apr 2020 18:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586276463;
        bh=9k/b210bXaKEO0jP41fWojcwSZNdDKVOFMT4jx7nUwQ=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=qbnRb6pYBIZS7TlG/84hivA/od637j1PGl9FswDR3DIvgKuIC60YeCh3IjKqEIeJc
         y1olhG9pByPV/uac90EJnYtDfaSGqs+3K0wK8N0ag94KRilmfeXGquR8GFO0vhdRXu
         6yPVNVvS4IhzGy3eExXFp109ws0f3MrD/R7b4kAY=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 4/9] media: adv748x: add definitions for audio output
 related registers
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <26573ecdb48aa816f802b9d8bbe5f74157248021.1585852001.git.alexander.riesen@cetitec.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <a0ff0a59-bd6e-044b-5669-679126c23323@ideasonboard.com>
Date:   Tue, 7 Apr 2020 17:21:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <26573ecdb48aa816f802b9d8bbe5f74157248021.1585852001.git.alexander.riesen@cetitec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On 02/04/2020 19:34, Alex Riesen wrote:
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  drivers/media/i2c/adv748x/adv748x.h | 32 +++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 0a9d78c2870b..1a1ea70086c6 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -226,6 +226,11 @@ struct adv748x_state {
>  
>  #define ADV748X_IO_VID_STD		0x05
>  
> +#define ADV748X_IO_PAD_CONTROLS		0x0e
> +#define ADV748X_IO_PAD_CONTROLS_TRI_AUD	BIT(5)
> +#define ADV748X_IO_PAD_CONTROLS_PDN_AUD	BIT(1)
> +#define ADV748X_IO_PAD_CONTROLS1	0x1d

What is CONTROLS1 (1d) referenced from here?

There's no 'field' matching for this register, and the 'bits' (0, 2, 3,
4) correspond to "pdn_spi, pdn_pix, '-', tri_spi"

Perhaps we need to define those bit fields accordingly and reference
them where they get used directly?

Perhaps calling bit 3 as:
 #define ADV748X_IO_PAD_CONTROLS_BIT_3	BIT(3)

Or
 #define ADV748X_IO_PAD_CONTROLS_RESVD	BIT(3)

(Unless you have documentation that better describes it?)


> +
>  #define ADV748X_IO_10			0x10	/* io_reg_10 */
>  #define ADV748X_IO_10_CSI4_EN		BIT(7)
>  #define ADV748X_IO_10_CSI1_EN		BIT(6)
> @@ -248,7 +253,21 @@ struct adv748x_state {
>  #define ADV748X_IO_REG_FF		0xff
>  #define ADV748X_IO_REG_FF_MAIN_RESET	0xff
>  
> +/* DPLL Map */
> +#define ADV748X_DPLL_MCLK_FS		0xb5
> +#define ADV748X_DPLL_MCLK_FS_N_MASK	GENMASK(2, 0)
> +
>  /* HDMI RX Map */
> +#define ADV748X_HDMI_I2S		0x03	/* I2S mode and width */

Looks like a more appropriate name than the datasheets
"hdmi_register_03h" :-D


> +#define ADV748X_HDMI_I2SBITWIDTH_MASK	GENMASK(4, 0)
> +#define ADV748X_HDMI_I2SOUTMODE_SHIFT	5
> +#define ADV748X_HDMI_I2SOUTMODE_MASK	\
> +	GENMASK(6, ADV748X_HDMI_I2SOUTMODE_SHIFT)

I'd be very tempted to ignore the 80char limit here and put that on the
line above ... or find a way to remove the 1 character...

In fact, given the entry there - how about just leaving this as:

#define ADV748X_HDMI_I2SOUTMODE_MASK	GENMASK(6, 5)


> +#define ADV748X_I2SOUTMODE_I2S 0
> +#define ADV748X_I2SOUTMODE_RIGHT_J 1
> +#define ADV748X_I2SOUTMODE_LEFT_J 2
> +#define ADV748X_I2SOUTMODE_SPDIF 3

Can we align these value in the column with the other values?

And as much as I hate long define names, it seems a bit odd that these
suddenly lack the HDMI_ part of the define prefix...

Should we either remove the HDMI_ from
 ADV748X_HDMI_I2SBITWIDTH_MASK
 ADV748X_HDMI_I2SOUTMODE_SHIFT
 ADV748X_HDMI_I2SOUTMODE_MASK

or add it to
 ADV748X_I2SOUTMODE_I2S
 ADV748X_I2SOUTMODE_RIGHT_J
 ADV748X_I2SOUTMODE_LEFT_J
 ADV748X_I2SOUTMODE_SPDIF

?

> +
>  #define ADV748X_HDMI_LW1		0x07	/* line width_1 */
>  #define ADV748X_HDMI_LW1_VERT_FILTER	BIT(7)
>  #define ADV748X_HDMI_LW1_DE_REGEN	BIT(5)
> @@ -260,6 +279,16 @@ struct adv748x_state {
>  #define ADV748X_HDMI_F1H1		0x0b	/* field1 height_1 */
>  #define ADV748X_HDMI_F1H1_INTERLACED	BIT(5)
>  
> +#define ADV748X_HDMI_MUTE_CTRL		0x1a
> +#define ADV748X_HDMI_MUTE_CTRL_MUTE_AUDIO BIT(4)
> +#define ADV748X_HDMI_MUTE_CTRL_WAIT_UNMUTE_MASK	GENMASK(3, 1)
> +#define ADV748X_HDMI_MUTE_CTRL_NOT_AUTO_UNMUTE	BIT(0)
> +
> +#define ADV748X_HDMI_AUDIO_MUTE_SPEED	0x0f

Can we keep the register definitions in address order please?

> +#define ADV748X_HDMI_AUDIO_MUTE_SPEED_MASK	GENMASK(4, 0)
> +#define ADV748X_MAN_AUDIO_DL_BYPASS BIT(7)
> +#define ADV748X_AUDIO_DELAY_LINE_BYPASS BIT(6)

Those bits do not describe the register they are in, not sure how to
address that without exceptionally long names though.. :-(

So perhaps how you've got them might be the best option...

> +
>  #define ADV748X_HDMI_HFRONT_PORCH	0x20	/* hsync_front_porch_1 */
>  #define ADV748X_HDMI_HFRONT_PORCH_MASK	0x1fff
>  
> @@ -281,6 +310,9 @@ struct adv748x_state {
>  #define ADV748X_HDMI_TMDS_1		0x51	/* hdmi_reg_51 */
>  #define ADV748X_HDMI_TMDS_2		0x52	/* hdmi_reg_52 */
>  
> +#define ADV748X_HDMI_REG_6D		0x6d	/* hdmi_reg_6d */
> +#define ADV748X_I2S_TDM_MODE_ENABLE BIT(7)
> +
>  /* HDMI RX Repeater Map */
>  #define ADV748X_REPEATER_EDID_SZ	0x70	/* primary_edid_size */
>  #define ADV748X_REPEATER_EDID_SZ_SHIFT	4
> 

-- 
Regards
--
Kieran
