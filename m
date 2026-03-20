Return-Path: <linux-renesas-soc+bounces-30034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNydJ2qCvWk4+gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 18:22:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3D2DE87E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 18:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393C2305E335
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDCA3B38A9;
	Fri, 20 Mar 2026 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ocitt93n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C932F25F5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027041; cv=pass; b=oe5qNxvhf6admGbSisxIs0ciuKeaZOIcZFHaHkrpYqpS9TgFa3UW5RdzXdRgppD2fLATahuQYWR6h4MY0g4EFwlxxBGUVBSD5jeSwIID/TIVbYcWQmlC3bucKtJ2vH2iJzje9dSRueZWCCESV0r9DsiNa9u3TR1I3tDX2ZHMzKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027041; c=relaxed/simple;
	bh=iNhZ2wMLyGc08p9SXAlItmThExJu1Q8bjF+bH96yuFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH2MXD3czEJF6H03NY4AMKWwpkWXnidJ3U11lzPqVGwWNlQD4IanFsZiLuAKn5HOLLWpB/HBjbvxIEgirVgfCUBkw50umxGADH2ueczn62uVcGuWMP/t/580H1pF6jYYCqk10bOliF3JBZAi1y8z5mWVxPaL3T3dL7wUOC4jKP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ocitt93n; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso6870755e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774027038; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDKkC4NpGCue1RtdKRxFebPYYPXkqf/X4hd2iGMMC4xSWnRS7TQf5uyoO4bVs9k/mQ
         ISKNwD6p+8/KNTdgvvyaxrvf/GnU02i3t6mMBsn9ji/zmwVvOT8TYiSiB3ibixrb/M3M
         zXJZvmPkCHpfKg7YCLQI14vcZpr3P1+I0gLRA5QQMnXP2AiE60aBIseJT+HFqcuLnHzL
         RGOno/IwKIKoMmAesFanE1vd4D4js5nTNy4MseAtWFFr7LEhZyUGfz2jo38zE7KbuxnT
         Y3qJCexPAfdhiBKiCJ+u0lnjm+gyXvtM8L75P50eD7Yum7fc/uN5xUL411egwPLiMRe1
         +SGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        fh=1UcoG2Tdfc9M1tuCYcGwNRAYTGrTMYBjQHiOkAX2U7g=;
        b=f1Kbd/WscWp1ofLHcCibPpbmanMzNZagbrGOFH1/ghsPfKfb/piQJAkyqHE8un6DDl
         rZ+QtXg3Yla6751sFbJ30XkplNTSbOSC6n29ZI9MqpC2Gr5qfNG7Gy7NZpQXbGsYAkXT
         YUa3+kaTt88Wth0dcbaMehqeofieLs6zCt2fzOjm00u4s863PKbBE2W2MNm6vnOiNznX
         /rYvi9y6OSE73NAVaZ6VOJp8brSlNtz6Us6vxrAZKZCd2EI6Omkf1S8XSDLUuzogwElB
         n3gz7k6MHaZ3J0oKBUaLc3ll81Q4Qwe5en3y8LBmK5MGZKPAhWXGvYMAk/kiTfpjWyF5
         Vidg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774027038; x=1774631838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        b=Ocitt93nTekwtDlqSu9wGP7rLIndoAGKkmWfTlOFMTHPGG45iJv52WPscJc56gggMY
         z67W2IXR0E5sM3BI+WBhqawHnAc0BeQ8fxx7jGmDv+5RVWbmVj/Zi2aGGhumlRqPRWIp
         4vJpn/u7lcmmlUZX3UBC/B8sIdBia3VCRCtrjsEdPNqgBarletLb6ApclowK26mhspnM
         xEZi1fPQSStcbrY4NkFtmlj24IiT6mbQ4a+54d9gEKnhXCnJk5QCNHe8tRly+Drvyl46
         f9pXLS8me+QoMhbxBxp3DcHGSNnah6/dJdOgM9V6ogvQWaW04QzapuCbtw1GsC593nMB
         DxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027038; x=1774631838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhFtNfGXo+sAGRLOrajRrqZfKQSgiwD114zY0m+OvzU=;
        b=o+j6Hxroq+G+tsvGJniVEc+E+X4F2Vi5TK9aseDRkV71klvfzaVsSs0fqnXQ2bqTxM
         BhvNLmzwZtQtcCkMb3xjY0AID19UlDIH7SB9hcDtGwHc65YC3X7bXpkDcXxeXzf5Ps0/
         dEaWOde1xwVNQEnwV/W83FHU55EKd1OHrnkQ2tV2gmfJRh7wER5tVrSEoeEeh/C+m8wU
         ui1wVvHjndj19PIkEWe6Po+BFehvO2zaoIHkoLSWM+PbBLQiCR2zrmCCT2n5RMmeEKdO
         8RPU2kOkSk32tQAXs6B8mq0CQau9FRbq4ubD95fQd/IsIJ9l17+bnBOHHLvUoOrFp97b
         a4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHC/H/hinmtYXXiegXF+H/1okO3HMd7orByFXUp2aYOkKTz/1R+TtMRGHKuj8acY5520XpdiNh+wlIt+0kAZzKAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQzm+uEsO3Grd9kZ65NyUXWjN9OO5nGB+lD9YK9+idtZQn1N6
	88d1c0ZnXwm5KzKONnB0AHyg1KTjKhLomFS7Y2GGjHOq5sCafngRxI7xysYLbclHrkpqHWUVs9r
	YlLv/iuJ4MZRRI/3QYWIlwvAsuiV5bTI=
X-Gm-Gg: ATEYQzxRg4UOtBatiWfVpKvMCp/MRKexpEj0/4uQq5SwiqHzAN0UZVcpQPBLWNlg6JF
	5Vm64USM5pNR6TF6iWxeHrK+OfWMMTf1UMacPaaCHGSDu7/MeKOvHOUfjkWW/CJdgh8+3LCV2Xo
	6QGzH7Irp+jlhalfscTY3KycWXm5eMw6mwfB+ggXR51LRlB+M2xiaX9XWOa0VBB+X1GnY5XkQsn
	HcUnTH6kNblK8TW8vGRYV1gBU1Bqe5AhOLDjsZeWCw6iKLl84xHB1DsemD//UrWI1ZciCGfwZ1m
	61TrMlrW0jbTzA/ZEeFA87HLDsh+jwwY2TpCBsmW008Ihcyloacc4XTXHkvl8XQYhW76rg==
X-Received: by 2002:a05:600c:8583:b0:485:3f1c:d8a1 with SMTP id
 5b1f17b1804b1-486fedb9631mr50339565e9.9.1774027037490; Fri, 20 Mar 2026
 10:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Mar 2026 17:16:51 +0000
X-Gm-Features: AaiRm50l-VieBOYlOBaF8d8MPJDUaDBpjbsbBE5CsWPetMD5LTkW9QNd0OxiFpg
Message-ID: <CA+V-a8t0pskENYNhBiYCk=NtU7w9J1wr3TMtH2GQm_bz_-8thw@mail.gmail.com>
Subject: Re: [PATCH 0/7] media: renesas: rzv2h-ivc: Fix concurrent job scheduling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <barnabas.pocze@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, stable@vger.kernel.org, 
	=?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <barnabas.pocze+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30034-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,cisco,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 47F3D2DE87E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patches.

On Fri, Mar 13, 2026 at 11:14=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> We have been exercizing the RZ/V2H(P) IVC block quite intensly these
> last two months.
>
> Here it is a collection of fixes and improvements to the driver.
>
> The first 4 patches in the series address a few registers writes that
> do not respect the documentation.
>
> The 5th and 6th patches fixes concurrent access to the list of queued
> buffers and fix a WARN() visible under heavy system load conditions
> caused by concurrent buffer transfers.
>
> The last patch is actually up for discussion. It is my opinion that the
> trouble of setting up a workqueue item is not justified by the
> relatively small amount of work that has to be carried out in interrupt
> context. In any case, there shouldn't be any functional change
> introduced by this patch.
>
> Patch #7 makes patch #6 reduntant: if we use direct function
> calls, then the issue of concurrently running workqueue items cannot
> happen. However, I actually think patch #6 has value regardless as it
> makes the code more robust.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Barnab=C3=A1s P=C5=91cze (4):
>       media: rzv2h-ivc: Fix AXIRX_VBLANK register write
>       media: rzv2h-ivc: Write AXIRX_PIXFMT once
>       media: rzv2h-ivc: Fix FM_STOP register write
>       media: rzv2h-ivc: Fix concurrent buffer list access
>
> Daniel Scally (1):
>       media: rzv2h-ivc: Revise default VBLANK formula
>
> Jacopo Mondi (2):
>       media: rzv2h-ivc: Avoid double job scheduling
>       media: rzv2h-ivc: Replace workqueue with direct function call
>
Tested the patches on RZ/V2H EVK with IMX708 sensor on next-20260319.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
On RZ/V2H EVK

Cheers,
Prabhakar

