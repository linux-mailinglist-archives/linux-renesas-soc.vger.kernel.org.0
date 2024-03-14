Return-Path: <linux-renesas-soc+bounces-3771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487387BA29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 10:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21F51F23C2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C8C6CDB4;
	Thu, 14 Mar 2024 09:14:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079C6BFD2;
	Thu, 14 Mar 2024 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407687; cv=none; b=J8mM1g//KCpgzo1JbOUfttqK6X6KvXJ3p0sMwGBJBw3dNuEOJDvIKO7qLzV5D1n4oaliNXGHnPxRsVwXaOTXpWkas00cTfqrhMCk3Vm8LACdk2WZyQ2PnPBAQcuc+peh1Thxu3g3eM0xC1T+xWpYQaL20P+Kf4jhOd475lI3o24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407687; c=relaxed/simple;
	bh=seqSV+lF1OaRIJKsveNwNp6KgJVzl5CYLb51gkmYVZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOt07V0ArOuxBXzhpjTdxXWnwdJD+TZHJQx9E3kGSk2FEmXxlycLoChdYnZy154bYSSDVA/M+NixpTQgISz4xAxIsjGYrsU9TU/6G9nKb5oxpTqyqS1caGZajj/RNkRZ20EhXoqF/CVRbMRtteH8X5zOAWZsBQ1aAuuz+8vwPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60cbcd04de8so5884777b3.0;
        Thu, 14 Mar 2024 02:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407683; x=1711012483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEXtpqYTtQhI3FXq9PWUVbeDJTLFVDpRROmQL3Uopb8=;
        b=FTD/QXnkt6r6/0nSvu8ZRFxzSnfQNuGDzKllzXVKITG7tPzImzE1Xea873ecEd0jKq
         N3Pl2IGBCg52FeDMa25iJIAi+Fh4uupi9Sd9GTFkNZ6hcl41clfLpHCrmFaQcNJ6zgG2
         lEneP/FEzf6T0Am0/Xut8m/tvU4ZK7qMTHaapi+LA0QO1bhPQWinOb+GsYZH+qmcvAHN
         QMLHCsYWLXe52hNmnqHlg9nj6NrmDZjsSX1yUx0Ycxwcdkp/Cod3Dv563OkFUIMq+P9V
         sE5Pl8JNtue3rFIDudqzflfnuYtXIcxVSmgWRLzqFPniy2c7r+cdcmVCb2qc347mV+Se
         qwGg==
X-Forwarded-Encrypted: i=1; AJvYcCW2J5kD9cXd3tGeSi/YBdF2ATXrTPL8ZagudvwCfzLmrq+XHZvCQqpdZnvFDU0Ckh+UmaaFtyWBgWtGs0eHnI6P2wxgRytbFroDMXb/Uqs5takMsjz7rhR5n9+cozDtwYYCWzqGtd7Sy7Ob7ZE=
X-Gm-Message-State: AOJu0Yy759mtBKW+x62LPRpuT/J6VzHR1LNHBmIaOkYvc1RGLYPfQUn+
	gbw5ki+UO7vs7a9jwA63azkxbBPi5MrwwmbMZaLvvx3AjWAdQtcj6oOmdFz2Jso=
X-Google-Smtp-Source: AGHT+IFmycTX6pAHeIZKYWaiw8fR+/gcjzYDG7XQZox7iWTHOsL6+zmztYWLnQ3D5PxnsEC3Ot74kA==
X-Received: by 2002:a0d:c507:0:b0:60c:bb52:3c55 with SMTP id h7-20020a0dc507000000b0060cbb523c55mr2678035ywd.18.1710407683091;
        Thu, 14 Mar 2024 02:14:43 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id k21-20020a81ac15000000b0060a0cd01a8fsm195342ywh.89.2024.03.14.02.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:14:42 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbed179f0faso1341989276.1;
        Thu, 14 Mar 2024 02:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrsy1exxMmWb8Rur/GF5NBQPgYhZnUQMSdq8F2xBaSEJZZ7vod6bxFLgxP4KzCk/o8/SrRIwO+MUkBRk2BkE76Wj6rPATfCcZvQtthRoLcuRWVE2J0f1UWIZcVoMrQ7s+69/nRQLsnIDakW3s=
X-Received: by 2002:a25:44d5:0:b0:dbe:d2ec:e31 with SMTP id
 r204-20020a2544d5000000b00dbed2ec0e31mr3492845yba.27.1710407681891; Thu, 14
 Mar 2024 02:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com> <20240313181602.156840-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240313181602.156840-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 10:14:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
Message-ID: <CAMuHMdUMEA2d9+H7GwDDLTfeXp2fAyBTt8jpihOzjCEMUuSK-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Nguyen <huy.nguyen.wh@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Mar 13, 2024 at 7:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> From: Huy Nguyen <huy.nguyen.wh@renesas.com>
>
> The RZ/G2L family SoCs has 10 PIPE buffers compared to 16 pipe
> buffers on RZ/A2M. Update the pipe configuration for RZ/G2L family
> SoCs and use family SoC specific compatible to handle this difference.
>
> Added SoC specific compatible to OF table toavoid ABI breakage with old
> DTB. To optimize memory usage the SoC specific compatible will be removed
> later.
>
> Signed-off-by: Huy Nguyen <huy.nguyen.wh@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped using of_device_is_compatible() in probe.
>  * Added usbhs_rzg2l_plat_info and replaced the device data for RZ/G2L
>    from usbhs_rza2_plat_info->usbhs_rzg2l_plat_info.
>  * Moved usbhsc_rzg2l_pipe table near to the user.
>  * Updated commit description.

Thanks for the update!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -640,8 +656,13 @@ static int usbhs_probe(struct platform_device *pdev)
>
>         /* set default param if platform doesn't have */
>         if (usbhs_get_dparam(priv, has_new_pipe_configs)) {
> -               priv->dparam.pipe_configs =3D usbhsc_new_pipe;
> -               priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> +               if (info->driver_param.pipe_configs) {
> +                       priv->dparam.pipe_configs =3D info->driver_param.=
pipe_configs;
> +                       priv->dparam.pipe_size =3D info->driver_param.pip=
e_size;
> +               } else {
> +                       priv->dparam.pipe_configs =3D usbhsc_new_pipe;
> +                       priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_new_=
pipe);
> +               }

I think it would be cleaner to populate
renesas_usbhs_platform_info.driver_param.pipe_{configs,size} everywhere,
and use info->driver_param.pipe_{configs,size} unconditionally.

>         } else if (!priv->dparam.pipe_configs) {
>                 priv->dparam.pipe_configs =3D usbhsc_default_pipe;
>                 priv->dparam.pipe_size =3D ARRAY_SIZE(usbhsc_default_pipe=
);
> diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/=
rza.h
> index a29b75fef057..8b879aa34a20 100644
> --- a/drivers/usb/renesas_usbhs/rza.h
> +++ b/drivers/usb/renesas_usbhs/rza.h
> @@ -3,3 +3,4 @@
>
>  extern const struct renesas_usbhs_platform_info usbhs_rza1_plat_info;
>  extern const struct renesas_usbhs_platform_info usbhs_rza2_plat_info;
> +extern const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info;
> diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs=
/rza2.c
> index f079817250bb..0336b419b37c 100644
> --- a/drivers/usb/renesas_usbhs/rza2.c
> +++ b/drivers/usb/renesas_usbhs/rza2.c
> @@ -58,6 +58,36 @@ static int usbhs_rza2_power_ctrl(struct platform_devic=
e *pdev,
>         return retval;
>  }
>
> +/* commonly used on RZ/G2L family */
> +static struct renesas_usbhs_driver_pipe_config usbhsc_rzg2l_pipe[] =3D {
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_CONTROL, 64, 0x00, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x08, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_ISOC, 1024, 0x28, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x48, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x58, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_BULK, 512, 0x68, true),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x04, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x05, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x06, false),
> +       RENESAS_USBHS_PIPE(USB_ENDPOINT_XFER_INT, 64, 0x07, false),
> +};

This is similar (but slightly different) from usbhsc_default_pipe[].
Can RZ/G2L work with usbhsc_default_pipe[] instead?  If yes, you could
just set  .has_new_pipe_configs to zero instead of adding new code/data.

> +
> +const struct renesas_usbhs_platform_info usbhs_rzg2l_plat_info =3D {
> +       .platform_callback =3D {
> +               .hardware_init =3D usbhs_rza2_hardware_init,
> +               .hardware_exit =3D usbhs_rza2_hardware_exit,
> +               .power_ctrl =3D usbhs_rza2_power_ctrl,
> +               .get_id =3D usbhs_get_id_as_gadget,
> +       },
> +       .driver_param =3D {
> +               .pipe_configs =3D usbhsc_rzg2l_pipe,
> +               .pipe_size =3D ARRAY_SIZE(usbhsc_rzg2l_pipe),
> +               .has_cnen =3D 1,
> +               .cfifo_byte_addr =3D 1,
> +               .has_new_pipe_configs =3D 1,
> +       },
> +};
> +
>  const struct renesas_usbhs_platform_info usbhs_rza2_plat_info =3D {
>         .platform_callback =3D {
>                 .hardware_init =3D usbhs_rza2_hardware_init,

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

