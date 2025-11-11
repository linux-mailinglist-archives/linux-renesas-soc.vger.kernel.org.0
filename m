Return-Path: <linux-renesas-soc+bounces-24460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 517DCC4D955
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 13:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F18B6342C5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 12:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570EA315772;
	Tue, 11 Nov 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyjIzro3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005823559F8;
	Tue, 11 Nov 2025 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862838; cv=none; b=sVxFFz5gZNgp5gkalzjm7LpjqoXDGslYRNvFVAE9nuLXxGvK+K+BTS8b7O8SwqnhYiUflbtGgIm0+XJfEIo3aEaQSbiWt/Jo9PCk3Xs7TIa95uRlTjSXb3d6PjmzGk0M55zGRycdkIeK7m+0KzU7qUSbKR2My5tP6+jfqQMXFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862838; c=relaxed/simple;
	bh=O8CvrRoMfamiivBrhxyLoF+42dG2wZYImhw8qkUTm7Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=E3sJ5zXyK3GTAymM8floM7BFbNCSCCj6X1FdIPT6boI9o4+6um4A2DTom45NkQjC1CEuUhBx6MIul1T0+pmmKGQpPf0J27V5M8DGUhNPMB0PODG8r+49qNsU8KSCOlcUGc3nCmQEQHYzrMe8EYCUx5A32CHxP9wPw92BXOEl0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fyjIzro3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 863A0FE;
	Tue, 11 Nov 2025 13:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762862713;
	bh=O8CvrRoMfamiivBrhxyLoF+42dG2wZYImhw8qkUTm7Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fyjIzro3aBiXkBcHDQQx8QsTQC8m9VXT5JaBenEIju1kycZ+PDjvx3biBqD5F6r2J
	 xYvqYyWVOoe/PrLUAS48CJgw1AHSUWEZ/bentPCNtclZcEn/HPr8MRgpty6xFjzc2l
	 kuNmuj1EWPGO0HZLV3o/Z9sdsXJV5Gxa2tGt1Ql8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
References: <20250910-rcar-vsp-underrun-revert-v1-1-2fa8d3b1b879@ideasonboard.com>
Subject: Re: [PATCH] Revert "media: vsp1: Add underrun debug print"
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Duy Nguyen <duy.nguyen.rh@renesas.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 11 Nov 2025 12:07:09 +0000
Message-ID: <176286282930.2141792.17722042639840544380@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Tomi Valkeinen (2025-09-10 08:26:43)
> This reverts commit 1dc30075fb0fe02b74b1ea7fd1c1c734a89f1448.
>=20
> There have been reports of lots of underruns happening on earlier
> generation SoCs (M3, E3) with display use cases, e.g.:
>=20
> vsp1 fea28000.vsp: Underrun occurred at WPF0 (total underruns 1)
>=20
> but the display still working fine, and reverting the above commit,
> which added underrun prints, makes the prints go away (obviously).
>=20
> I made some tests on a remote M3, with no display connected, and I can
> confirm that there seem to be a single underrun report quite often when
> enabling a display, and an underrun flood when using interlace display
> modes.
>=20
> E3 does not have interlace display support as far as I can see, so the
> interlace issue does not concern it.
>=20
> Debugging display issues remotely without a display is quite
> challenging, and I did not find any issues in the code, nor could I find
> a way to stop the underruns by twiddling with the related registers.
>=20
> My pure guess is that the single underruns occurring when starting the
> display hint at either a startup sequence issue, or some kind of initial
> fifo loading issue. The interlace underruns hint at a bigger
> misconfiguration, but as the display works fine, the issue might be just
> an underrun at the start of the frame and the HW quickly catching up, or
> at the end of the frame, where one block in the pipeline expects more
> data but the previous block has already stopped (so maybe a misconfig
> between using interlaced height vs progressive height?).
>=20
> But at the moment I have no solution to this, and as the displays work
> fine, I think it makes sense to just revert the print.

Is there any value in instead 'ignoring' any underruns if say the frame
count is < 5 to ignore startup underruns, and keep it as an active print
if something causes underruns later once the pipeline is established?

But maybe that doesn't change much - and if there's no current perceived
issue


Anyway, I don't object to this revert. It's low impact and it's only
undoing 'your' work so no one else will complain :D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 +----------
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 --
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 --
>  4 files changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drm.c
> index 15d266439564..b8f211db16fc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -721,9 +721,6 @@ int vsp1_du_setup_lif(struct device *dev, unsigned in=
t pipe_index,
>                 return 0;
>         }
> =20
> -       /* Reset the underrun counter */
> -       pipe->underrun_count =3D 0;
> -
>         drm_pipe->width =3D cfg->width;
>         drm_pipe->height =3D cfg->height;
>         pipe->interlaced =3D cfg->interlaced;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index b8d06e88c475..68e92d3c5915 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -47,8 +47,7 @@
> =20
>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  {
> -       u32 mask =3D VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
> -                  VI6_WPF_IRQ_STA_UND;
> +       u32 mask =3D VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
>         struct vsp1_device *vsp1 =3D data;
>         irqreturn_t ret =3D IRQ_NONE;
>         unsigned int i;
> @@ -63,14 +62,6 @@ static irqreturn_t vsp1_irq_handler(int irq, void *dat=
a)
>                 status =3D vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>                 vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
> =20
> -               if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
> -                       wpf->entity.pipe->underrun_count++;
> -
> -                       dev_warn_ratelimited(vsp1->dev,
> -                               "Underrun occurred at WPF%u (total underr=
uns %u)\n",
> -                               i, wpf->entity.pipe->underrun_count);
> -               }
> -
>                 if (status & VI6_WPF_IRQ_STA_DFE) {
>                         vsp1_pipeline_frame_end(wpf->entity.pipe);
>                         ret =3D IRQ_HANDLED;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/me=
dia/platform/renesas/vsp1/vsp1_pipe.h
> index 7f623b8cbe5c..9cc2f1646b00 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -137,8 +137,6 @@ struct vsp1_pipeline {
> =20
>         unsigned int partitions;
>         struct vsp1_partition *part_table;
> -
> -       u32 underrun_count;
>  };
> =20
>  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/me=
dia/platform/renesas/vsp1/vsp1_regs.h
> index 10cfbcd1b6e0..188d26289714 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -32,12 +32,10 @@
>  #define VI6_STATUS_SYS_ACT(n)          BIT((n) + 8)
> =20
>  #define VI6_WPF_IRQ_ENB(n)             (0x0048 + (n) * 12)
> -#define VI6_WPF_IRQ_ENB_UNDE           BIT(16)
>  #define VI6_WPF_IRQ_ENB_DFEE           BIT(1)
>  #define VI6_WPF_IRQ_ENB_FREE           BIT(0)
> =20
>  #define VI6_WPF_IRQ_STA(n)             (0x004c + (n) * 12)
> -#define VI6_WPF_IRQ_STA_UND            BIT(16)
>  #define VI6_WPF_IRQ_STA_DFE            BIT(1)
>  #define VI6_WPF_IRQ_STA_FRE            BIT(0)
> =20
>=20
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250908-rcar-vsp-underrun-revert-f3e64612c62d
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

