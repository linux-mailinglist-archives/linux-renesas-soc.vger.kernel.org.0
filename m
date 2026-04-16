Return-Path: <linux-renesas-soc+bounces-31335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGFsODoh4WnMpQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 19:49:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7734134A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 19:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C14423019D58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 17:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0AC24DCF9;
	Thu, 16 Apr 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF7LhrJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0C1CAA78
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361784; cv=pass; b=i5PZoCJmaZGFOX+Sd6TcAgGhOeO8jgiHZWNp2zB1KBzrSO4Ka3n0OAoI6Qq3oM8VBhTegd2eByry7ZK+LOJt2K6aZOcKwLRSKFBCJ0eE0Uq3oUcTvIVM1/u6w8w3qjBh46xFV5IBhQMU0Bo+CJsHRAsFtjxbJnsb31sBC6A81L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361784; c=relaxed/simple;
	bh=N2l9XO6zlswJKBM2ahNi6lAm8gu1vKRNmeiU1ZIic4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/TO0Va2CPEko9Ow669nDNPW5Os8H8XOjtR8KAmVTYuHAO85r0X0xdbFn9htHdoVD4VLA4URSF7scC0vMUL68sExqfgx+9Qot/l4DEF4mhJ6nuxuYZrh3At4M/SThArMVT0sIE8KeWDzf0VAGtewEpjbia1HkYIu2ajPhvwVyWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF7LhrJy; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so77702025e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 10:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776361781; cv=none;
        d=google.com; s=arc-20240605;
        b=GXt/d+gdZL78IkSLZJpPa5FW+qUruN9buqnTBkRGGdGXmBXj1CCJHWwCQJzMvhQOmG
         vn+nvQYcXUzpFpXvpDH6IdQ3GNKuJCL+cHoPmrBUTk9hpjOxzWn7Vn/pxx9C5IrWftrF
         OJpw6y78OjGfGogU2Vmb+JVRZFHS5f+pVkGaTBXS9pINQRVhaVhXq+sQqYQURNdp5CdG
         xgsm9kwZiXk/Kf4qMl9v5KWYTTv/sYqGcABkm41Nw3VDEvjE/Dmjkv1G1+++rbC8V9JQ
         dZENJDEu2ZiTO92J5FZB7XXn1JTguqaUL6XWiZFRuYoRKrXq8IT0v7+rkANCpfM835ra
         pICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        fh=qZ3rHXUAZd0Hg1i9gxjAp71P+2kMgsU73fdTIDbmdOw=;
        b=O/iS2FfmQdG6xcFWOSeWQ2BCoS2PzFR1JzkZqj6XGwuqeAo3cdmohj47dzPFDM5FiA
         dCYh6DLDfb7Rob+LJwNgn3y3G6i7whF5ZU78nbs2tBz+SJHCDwBoHEijaa4GnPVl31AR
         n/9GXRzlbGd80ESBqPjZY3WJpx2m3qOcHKOJj1nv9mV4XPO28FwwBnjni/vWG7wyhuQL
         /p+ZiO7nGFMpSBfkfATryVBe1r2HerWkt/YhaQcj3W0t1epm37MFkx9lKq8WDVzNWuCA
         vuyn6mMRrj3Er0vuvW4EfRlkq0qaCHL85brSrjuAOIvvZpmFVKk2jcKImDD2M35DYNuO
         3jgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776361781; x=1776966581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        b=EF7LhrJylm6XtH0+m7yUBrVN6a97aqgJFAfEsML7qg7FH3ueI230VEAy7oHyvLL7Cu
         VnmhGhbkTbACTrWacnQjJrg0vkuFkYVtxNc7wgZT+pssRVdAbxfJPmlSiPsor0lZgvI4
         mbAFBKDPLEbsRXPYQ0O1XR/8YjjugXBDfk/pUaacvXOOYS8r9YJmG6nvMlIxbywPjCq8
         oZrZNFXquDesx0RiAcjpxAsJXAbf1wP2yEpwMnm7y6MbO/kU3MazQqX9Sor2cI0S0QXn
         PtFVtvwS9hi1Q18pTkJsQRhqDOO3yt8zic0YsuQ7sD8ZKSkhAjMHxJtqQ5pFC8RycpbT
         6weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776361781; x=1776966581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        b=PAKdyKiXsBCNPinndRmIoJyQkQY5XIo4sSuQkmkWiJd1gNK27peY88EpXwn8jjdv3g
         p5Y8vm4kuBRkRqiD8xAhMv/sIwL9uNcWzN5zNSCXKhDGV3klt20wTPluMXoU1KE9bJGV
         Bdz7z5azo1CvOZXwRDH7QzjHwCECH8vtQIxUGt0hLZGuuXyBGuZmz1v0torvPpJZq5yO
         X7Sv9o80Igz1wZziRzbfJ6QSYZTxQoZO/+fhMNskLRsxki0VmX/oYX7SYyUbdYEVH7H6
         V0RlFFpiHt4NSYTc5M1N/Qm6lQOqaLrocDLPloqUSRbVhEJfZ2Z62H+dcNvYpWmgdNyO
         IaXw==
X-Forwarded-Encrypted: i=1; AFNElJ9+dqQ2Twr7Xbva/fZCoClJ8k43Y00AHgEj9S9Nja745MlgqawfdWbqj9CnwCpWw1efCi07gROCx209HMVaep4tQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvs75jp95RsrGu8A/cqg96yBpAC+/PhG/Dlmn4XQ6QlDyilXc
	HlLSwuoEkZzl591tbxqGio12bk2XvusS6SKeSmvc9nzKqpZ6JMxXl3v++9AHikuIL3MgTks3YUy
	PRp+yE1AulKGLnQCEC2+BmZtdaoA5yL8UnfBDXvo=
X-Gm-Gg: AeBDievTv637ttxXGzpjMd7ryWifLB+MrK6WGpOV3hJDi6XBJPr8GBNmVIPmwwnZArI
	KHUb4EnDmwHgnxsKfK1LERZJuNkYIFip+iw6WHiNQ9ZBDjQUmUguVbt+S8Rsa4cG3/z3rUeYgeE
	SfSiVjxfrfrDnVH/1/bqUJ+e5+KXhHdzpB7JRV6oSsPoxva5BDx7hNOaNOppfB7SL5W/5+iNpbF
	/qU1t++a1O3b2qZVS/G/LInrPowl6rAay1D041nQFYbZlF+dp9GjwpUeZi76kJgtT3q6FSgWydP
	6Bn1Y7eR6+GlAcSA9mKnz0jlR0qAEuAuesmAjl9L/YjpoFIWOAtHNY4Hqt+JtXMPC+2+UiUldYM
	YGjxYF06x4KcRF6VoHYBDCSKBGFabLE6EE9XT
X-Received: by 2002:a05:600c:8218:b0:488:a14d:3d81 with SMTP id
 5b1f17b1804b1-488d67c7034mr450974285e9.2.1776361780621; Thu, 16 Apr 2026
 10:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Apr 2026 18:49:14 +0100
X-Gm-Features: AQROBzCxpsL5kTxUeNnQCxkGGBdAiuMuBdZQoMRS7IDiOjMBaTiRtIu9DdGKUbM
Message-ID: <CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31335-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:url,ideasonboard.com:email,mail.gmail.com:mid,ragnatech.se:email]
X-Rspamd-Queue-Id: 7B7734134A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thank you for the patch.

On Wed, Mar 18, 2026 at 11:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The format width and height is never propagated to the BRX source pad,
> leaving its initial configuration invalid. Propagate the whole format
> from the first sink pad to the source pad instead of only propagating
> the media bus code. This fixes compliance with the subdev format
> propagation rules.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_brx.c
> index dd651cef93e4..911359faa600 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subde=
v,
>                 compose->height =3D format->height;
>         }
>
> -       /* Propagate the format code to all pads. */
> +       /*
> +        * Propagate the format code to all pads, and the whole format to=
 the
> +        * source pad.
> +        */
>         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
>                 unsigned int i;
>
> -               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> +               for (i =3D 0; i < brx->entity.source_pad; ++i) {
>                         format =3D v4l2_subdev_state_get_format(state, i)=
;
>                         format->code =3D fmt->format.code;
>                 }
> +
> +               format =3D v4l2_subdev_state_get_format(state, i);
> +               *format =3D fmt->format;
When running kms-test-plane-position.py (from [0]) on RZ/V2H EVK, Im
getting vblank timeouts as seen below:

[   51.295849] ------------[ cut here ]------------
[   51.300538] [CRTC:45:crtc-0] vblank wait timed out
[   51.305514] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1921 at
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c
[drm_kms_helper], CPU#1: python3/413
[   51.319577] Modules linked in: sha256 cfg80211 bluetooth
ecdh_generic kpp ecc rfkill snd_soc_hdmi_codec snd_soc_core
snd_pcm_dmaengine snd_pcm snd_timer snd soundcore rzg2l_du_drm
spi_rpc_if drm_client_lib vsp1 rzg2l_cru videobuf2_vmalloc
drm_dma_helper videobuf2_dma_contig videobuf2_memops rcar_fcp
rzg2l_csi2 videobuf2_v4l2 renesas_usbhs rzg2l_mipi_dsi ov5645
videobuf2_common adv7511 v4l2_cci phy_rzg3e_usb3 panfrost v4l2_fwnode
reset_rzv2h_usb2phy v4l2_async drm_display_helper drm_shmem_helper
videodev rtc_isl1208 cec gpu_sched rtc_renesas_rtca3 mc
display_connector drm_kms_helper renesas_rpc_if drm fuse backlight
[   51.374382] CPU: 1 UID: 0 PID: 413 Comm: python3 Not tainted
7.0.0-next-20260415-00258-gf9ef0131676a-dirty #340 PREEMPT
[   51.385280] Hardware name: Renesas RZ/V2H EVK Board based on
r9a09g057h44 (DT)
[   51.392521] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   51.399505] pc :
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
[   51.407624] lr :
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
[   51.415739] sp : ffff800083dbb9d0
[   51.419067] x29: ffff800083dbba00 x28: 000000000000000a x27: 00000000000=
005c5
[   51.426237] x26: 0000000000000000 x25: ffff0000ca4c0888 x24: 00000000000=
00001
[   51.433406] x23: 0000000000000001 x22: 0000000000000000 x21: 00000000000=
00000
[   51.440575] x20: ffff0000c7cb4980 x19: ffff0000c325e618 x18: 00000000000=
0000a
[   51.447743] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000=
00000
[   51.454911] x14: 0000000000000000 x13: ffff8000818c3ca0 x12: 00000000000=
001fc
[   51.462079] x11: ffff0000c0fcd360 x10: ffff8000832bd200 x9 : ffff8000818=
c3ca0
[   51.469248] x8 : 3fffffffffffefff x7 : ffff80008191bca0 x6 : 00000000000=
00000
[   51.476416] x5 : ffff0003fdf93088 x4 : 0000000000000001 x3 : 00000000000=
00000
[   51.483584] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000cc1=
9af40
[   51.490753] Call trace:
[   51.493212]  drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c
[drm_kms_helper] (P)
[   51.501336]  drm_atomic_helper_commit_tail_rpm+0xbc/0xd8 [drm_kms_helper=
]
[   51.508237]  commit_tail+0xa4/0x1a4 [drm_kms_helper]
[   51.513313]  drm_atomic_helper_commit+0x178/0x194 [drm_kms_helper]
[   51.519605]  drm_atomic_commit+0x8c/0xd0 [drm]
[   51.524307]  drm_mode_atomic_ioctl+0xac8/0xe00 [drm]
[   51.529523]  drm_ioctl_kernel+0xc0/0x128 [drm]
[   51.534217]  drm_ioctl+0x354/0x4c0 [drm]
[   51.538389]  __arm64_sys_ioctl+0xa4/0xf4
[   51.542342]  invoke_syscall.constprop.0+0x40/0x108
[   51.547161]  el0_svc_common.constprop.0+0xb8/0xd8
[   51.551892]  do_el0_svc+0x1c/0x28
[   51.555229]  el0_svc+0x38/0x140
[   51.558397]  el0t_64_sync_handler+0xa0/0xe4
[   51.562603]  el0t_64_sync+0x198/0x19c
[   51.566286] ---[ end trace 0000000000000000 ]---
[   64.735886] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
[   64.742630] rzg2l-du 16460000.display: [drm] *ERROR*
[CRTC:45:crtc-0] commit wait timed out
[   74.975884] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
[   74.982639] rzg2l-du 16460000.display: [drm] *ERROR*
[PLANE:40:plane-1] commit wait timed out
[   75.999845] ------------[ cut here ]------------

Reverting this patch fixes the issue, but compliance might fail. On
V2H media device is not registered for VSP.

[0] https://git.ideasonboard.com/renesas/kms-tests/src/branch/master/tests

Cheers,
Prabhakar

