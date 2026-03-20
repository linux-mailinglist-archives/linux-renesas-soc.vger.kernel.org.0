Return-Path: <linux-renesas-soc+bounces-30021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B6ZE2REvWkR8gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:58:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BA2DA96D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 13:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2B9A3016ECD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 12:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3DC3B2FE6;
	Fri, 20 Mar 2026 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSFfy+bD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6972441B8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 12:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011378; cv=pass; b=Dh59rjF3gYDgWq1GtM0SjZQb24P5z+SGNA+AmgOVyps8t0va0kDVDhEFXloZJf6+DZRSraajkItImV4YQs6nLo7FRZCUjabmykdanc8jAi7qrwE4Gi/ZEWFBU/uIHkElqdLt6ib3hADDjkvByjz5yDGho1AycQ/6V6+wOmUnq8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011378; c=relaxed/simple;
	bh=l0dCVtf1Q2nJWHvZVpWox+4B/72E5cLdI83NC6XCIVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BulaZnuP4LpKF80QlvZkAcRqxGe4oCHAPoSODlDdKuq1efzgWi+g0STwEEfkXPfDUQD43tVTKXboBEu7fWNZxnXvm9rAmkPVvwrTLCJIUE/jRyl8bJ7HgE+pbDs3l2Dm4V9FhjefKlv4xc0LaBQwfYwCaBK+dDcWQdy1jqxyjtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSFfy+bD; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso13431055e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 05:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774011375; cv=none;
        d=google.com; s=arc-20240605;
        b=IluDU9W2Pz81hb+TepXlya5IdPaEUIFOZ+mGJcmcl3e1bF2B5VAzOIZuWxadmZj7Cu
         1ef2qgpYr2B/UDX98qnQtrTsPNeIQiqFJyIRhxpYPpLyQxJeMFNh5nz7gZsN02kzUZDc
         9SAvltkJ0koAeDfls4cybrX2KrK+zry8Nn29o2177HYwavcjiP+2AUDSYHu2HJse8+Ay
         WG4ELOJ0wzlVuBZaLgRSfaWwLSqifT5rSe9iSIfZM3LvVvswjUmr24tlfoNVqNSnM+BT
         KBUYwJzAI1pQhArbpmaDxzZnT25p61pku+1MSLDo1FpxzQd6+RIl51PC+3BhwmHxhwGG
         q6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gjt6likqvkrmvVmxAGeCEmY5nIAAim1slhNrHJIdj0=;
        fh=/Aev8b2/8LEM1WUSbQ8ktAh5+X8XibjHTbLIKzeIPck=;
        b=VX2Q/b3AXNEmjOmV8NTfTdoBpzIr6nlciEk+TAQL2hjNNqNEZ0eXgeKeuZJ0r7l3mP
         6ekuB4/8npuFCW7Z29LPdt4sEEmg3wy4WR/OI/NYjW1VJk7se5YMsZTQztpW9URDkUot
         OtNAQUVgr/sLuxRsOdgCBKDMEKuuajR0xjtzSRa5mbqnyJ2LLLOiFtxCIrIethrHc3T5
         0qgq7rcueuKenQy5KB4xVqv2ZVmqyMUccp37ZH+h4+Xl76GTEG9s9ipXSFUY45KSU7m7
         jt7JFY/XhG8AVye/dYr60pS8H8YIglypnzrOfTuwLXNsuwdVdKK/nqoAZVsqLFlVn4yt
         xfrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774011375; x=1774616175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gjt6likqvkrmvVmxAGeCEmY5nIAAim1slhNrHJIdj0=;
        b=nSFfy+bDfdOMH3ZkiNIKy1gN2LYmR3fO0gzySZAmXsb6FL8J+kfXOaWPcYulE0dlGx
         4PU+I5ja9GR0g+rSOSlhWTe+uFGViPlH/klQ3wqlQQwv6bcpGX8PB4KppOaImNg4is6R
         B3706z7++SIWFk3OlMD2x+gZMG0W39DkKFQXc9BEAeNTvazWWFKxLF7tMn9SFBlAdC2V
         s/Y1CXqMYuZ01iJBxWV+W1h1SBO3H1rWCECebiRiZqejBb8u/t+3OIZwREOLPyQDdI3b
         rVW9+125jNlLulBv+IdAiWT3rg9sGLmnNEk0FzKJew3vfuNknDWdDj4gNEx5tsTxyt6D
         Kr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774011375; x=1774616175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gjt6likqvkrmvVmxAGeCEmY5nIAAim1slhNrHJIdj0=;
        b=K4XkFX1MFgDH7u7gicGyQcG2r5F1Wh4XKDJr5Jhope7tu8uDIUoPmvxyAhNBzHZx5m
         Qn0WLwrzhbqiVT14rhp9OqPxsjiVrAqaBkC6CHnf0nLKnq9cDwhDH6V6PieVvltLqguY
         WOV+EsNe4e/+IC2GzpLZBFVzQ+qmS9/20qkcU5iK9aYKAY68EYd65taW1r/oZMD1+Gxj
         XX0bRJQLPsv/bQmp/xGAemcGqEhx13IXtPgbTbgVTh5K/OyZUJ5oQ/pZr5RSJDXydVdA
         bawuWjiUm2E3cOCpnqwbKZbKZK0f60SkIpopg7Zns0+fymCmTAYXqO4PnShToBm8b6gT
         1Gwg==
X-Forwarded-Encrypted: i=1; AJvYcCWlkI9FcCFHg8LHeRHtNbvZ486uQ1cGzPsmt0QPwODitewnuwQ4C0Uk6ybtpZGeh2TrHAIpLKy5FiCp5fy8GeVVNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWY5uEmuGfRpVO0z8W7U2g/jhYD4RumIEYf6QkZmDEOmFrc+Qf
	r3TbqfTa3d6l70Cf4IFlj8DYu16CAAIJawoR5KfVw8gH4PufGbk7zia93S6ZkrTgeTWAI38X+BU
	/us7agoi/KVF2VSttkgr2qu713D2DZWg=
X-Gm-Gg: ATEYQzywgFNl5HLw3MJiYhBctlqrqKBeWmB8T2BVirp34pP/dy+InnrX9ubW6oJeulZ
	UeF3DrjX0RWf5Or70/cYUkaVQOK0tP5+zFP2lwy9QXW66x/+g+IMSmoIwrM/o7K1MruV+Zwyx7S
	sDCBso1Ohvsv7/b+fvU3RAxD2VD/d5t9VtWuc3vE05dtyApFmhXlz/XhGaLIUKLFooI4/CrUZcX
	mHISF0ZfioEvYjJ7qpkxSSVdpD6zQXBD0tCNfwFRXCPceZhhCPiX3lfbE/yPei++vswHKRwyVT3
	cUFJNUM47ZREVRi7S2EzyNmfWm+sfiBBUpyfS/zLkDJE9eapxAcIh/5R9iDXLax2yTld93M=
X-Received: by 2002:a05:600c:a69d:b0:487:288:1198 with SMTP id
 5b1f17b1804b1-487028812b5mr9531915e9.22.1774011374519; Fri, 20 Mar 2026
 05:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Mar 2026 12:55:48 +0000
X-Gm-Features: AaiRm5196O41GsHvTw47r0rJt0gHdI7DBMkpX7v-9SeQrKwzHXlL18JV49mX2bo
Message-ID: <CA+V-a8u833zheYTFC768pvJjbnidbNpQ70=GDg+_n2tmA8efhw@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: renesas: vsp1: Fix v4l2-compliance failures
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30021-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.849];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,buildroot:email,renesas.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 8D9BA2DA96D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thank you for the patches.

On Wed, Mar 18, 2026 at 11:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This series fixes most of the v4l2-compliance failures in the VSP1
> driver. The v4l2-compliance log is very long, so I've only included the
> executive summary, if anyone wants the full log, please let me know.
>
> ----------------------------------------
> root@buildroot ~ # v4l2-compliance -m /dev/media2
> v4l2-compliance 1.33.0-5460, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 91a4a7a9a5b3 2026-03-18 21:55:59
>
> Compliance test for vsp1 device /dev/media2:
>
> Media Driver Info:
>         Driver name      : vsp1
>         Model            : VSP2-I
>         Serial           :
>         Bus info         : platform:fe9a0000.vsp
>         Media version    : 7.0.0
>         Hardware revision: 0x01011404 (16847876)
>         Driver version   : 7.0.0
>
> [...]
>
> Compliance test for vsp1 device /dev/v4l-subdev14:
>
> Driver Info:
>         Driver version   : 7.0.0
>         Capabilities     : 0x00000000
>         Client Capabilities: 0x0000000000000002
> interval-uses-which Media Driver Info:
>         Driver name      : vsp1
>         Model            : VSP2-I
>         Serial           :
>         Bus info         : platform:fe9a0000.vsp
>         Media version    : 7.0.0
>         Hardware revision: 0x01011404 (16847876)
>         Driver version   : 7.0.0
> Interface Info:
>         ID               : 0x030000ab
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x00000014 (20)
>         Name             : fe9a0000.vsp hgo
>         Function         : Video Statistics
>         Pad 0x01000015   : 0: Sink
>           Link 0x0200003b: from remote pad 0x1000013 of entity 'fe9a0000.=
vsp clu' (Video Look-Up Table): Data
>           Link 0x0200003d: from remote pad 0x100001c of entity 'fe9a0000.=
vsp hsi' (Video Pixel Encoding Converter): Data
>           Link 0x0200003f: from remote pad 0x100001f of entity 'fe9a0000.=
vsp hst' (Video Pixel Encoding Converter): Data
>           Link 0x02000041: from remote pad 0x1000022 of entity 'fe9a0000.=
vsp lut' (Video Look-Up Table): Data
>           Link 0x02000043: from remote pad 0x1000025 of entity 'fe9a0000.=
vsp rpf.0' (Video Pixel Formatter): Data
>           Link 0x02000045: from remote pad 0x1000028 of entity 'fe9a0000.=
vsp sru' (Video Scaler): Data
>           Link 0x02000047: from remote pad 0x100002b of entity 'fe9a0000.=
vsp uds.0' (Video Scaler): Data
>         Pad 0x01000016   : 1: Source
>           Link 0x020000a1: to remote pad 0x1000002 of entity 'fe9a0000.vs=
p hgo histo' (V4L2 I/O): Data, Enabled, Immutable
>
> [...]
>
> Sub-Device ioctls (Source Pad 1):
>         Try Stream 0
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: =
OK
>                 fail: v4l2-test-subdevs.cpp(369): fmt.width =3D=3D 0 || f=
mt.width > 65536
>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,=
 fmt.format)
>         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         Active Stream 0
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVA=
L: OK
>                 fail: v4l2-test-subdevs.cpp(369): fmt.width =3D=3D 0 || f=
mt.width > 65536
>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node,=
 fmt.format)
>         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> [...]
>
> Grand Total for vsp1 device /dev/media2: 812, Succeeded: 808, Failed: 4, =
Warnings: 0
> ----------------------------------------
>
> The remaining failures are, I believe, bugs in v4l2-compliance. They are
> caused by the histogram source pad, which uses the
> MEDIA_BUS_FMT_METADATA_FIXED format, hardcoding the width and height to
> 0. I believe this is a correct behaviour, as documented in [1]. I will
> try to send fixes for v4l2-compliance.
>
> The series has also been tested with the vsp-tests suite, which reported
> no regression.
>
> Compared to v3, this version addresses issues in the HSI, HST, HGO and
> HGT modules that did not appear with the VSP-BD but get reported with
> the VSP-I.
>
> [1] https://docs.kernel.org/userspace-api/media/v4l/subdev-formats.html#m=
etadata-formats
>
> Laurent Pinchart (13):
>   media: renesas: vsp1: Store supported media bus codes in vsp1_entity
>   media: renesas: vsp1: Store size limits in vsp1_entity
>   media: renesas: vsp1: Fix code checks in frame size enumeration
>   media: renesas: vsp1: rpf: Fix crop left and top clamping
>   media: renesas: vsp1: rpf: Fix crop width and height clamping
>   media: renesas: vsp1: rwpf: Fix media bus code and frame size
>     enumeration
>   media: renesas: vsp1: brx: Fix format propagation
>   media: renesas: vsp1: hsit: Fix size enumeration
>   media: renesas: vsp1: histo: Fix code enumeration
>   media: renesas: vsp1: histo: Fix size enumeration
>   media: renesas: vsp1: histo: Fix format setting
>   media: renesas: vsp1: Implement control events
>   media: renesas: vsp1: Initialize format on all pads
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
HiHope RZ/G2M


Test-logs - https://gist.github.com/prabhakarlad/2b0050eec5d7e2ea41e4687afd=
ee1f9d

Cheers,
Prabhakar

>  .../media/platform/renesas/vsp1/vsp1_brx.c    |  37 ++---
>  .../media/platform/renesas/vsp1/vsp1_clu.c    |  47 ++-----
>  .../media/platform/renesas/vsp1/vsp1_entity.c | 112 +++++++--------
>  .../media/platform/renesas/vsp1/vsp1_entity.h |  21 +--
>  .../media/platform/renesas/vsp1/vsp1_histo.c  |  97 +++++++++----
>  .../media/platform/renesas/vsp1/vsp1_histo.h  |   2 -
>  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  61 ++++++++-
>  .../media/platform/renesas/vsp1/vsp1_iif.c    |  39 ++----
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |  40 ++----
>  .../media/platform/renesas/vsp1/vsp1_lut.c    |  47 ++-----
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |   7 +-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 127 ++++++++++++++----
>  .../media/platform/renesas/vsp1/vsp1_rwpf.h   |   6 +-
>  .../media/platform/renesas/vsp1/vsp1_sru.c    |  63 ++++-----
>  .../media/platform/renesas/vsp1/vsp1_uds.c    |  62 ++++-----
>  .../media/platform/renesas/vsp1/vsp1_uif.c    |  40 ++----
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  13 +-
>  17 files changed, 442 insertions(+), 379 deletions(-)
>
>
> base-commit: a93a51f42ac354425a252210183c4151d991f75d
> --
> Regards,
>
> Laurent Pinchart
>
>

