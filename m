Return-Path: <linux-renesas-soc+bounces-32682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP8yO0gRB2rgrQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:27:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED554F8A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 297C430BB3AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 12:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2994F3FB046;
	Fri, 15 May 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSiedV18"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3947DF81
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846787; cv=pass; b=XYhgjNnijmHCZ4HipVZqu6MC4YClZ01nLscRHMBSsecARBlnGeEHCfI9N8A5iRjc3OruXyhbSWhgCW0EAcZJuTvecxXQCU3wQ8xAgr8AV1P1UsrHmj7LG876kl5XGiPp+JKaeReU5d9Abmmp56QNdbxA1yobqi9GafL/lIVP5aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846787; c=relaxed/simple;
	bh=q5bl+69zkmypiwMoiO+7fjfWxyUFssPPi1EuZdo7nIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEHRxJr56iMkxUYG2ZadLlCaR2QQ9ykXVhDAGMPFwLtmOgiMY3wsFUfGShozHuxEKghN8CfSCR4Q+XfR9B3I2dKrjAd/grbggCCo5i2j1c09UGLB9b8xW7AR8LqItY+ZRmgAiizPPE3/5KXW9+HbbZJFgvGFzlJgPTBcGdS5eEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSiedV18; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-441209fb77eso511931f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 05:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778846784; cv=none;
        d=google.com; s=arc-20240605;
        b=GLVDkRub835OBkOryjYI8w71S8C2CtD4kbsZiHVzeQVSRCR9DNVH9N9a0+Thp4po1a
         XU/7qbpCyRCctH3e6MFUMSzy7I4fNjb3x459V8HfGfsEpytJ5KqwoCvI3mIIatOzJCpI
         CO43UhmOxlo0kl0mh8xJAY/yUloz1KK/gPDJVfeBUnwhP8KhtOfSiOtIutnnNUfJxXSg
         xr6diViNMMKbVCYvMiqxVJ+e2Sr/AQE0wZEqcHIjFJRHkOeYmEp7BUe0PQF5F8JrJzDP
         cLjyKXnmOYMYHLVRVSBcAAFovWGELRxMb1l4P6g26JqRC7SnQ/0DrpzZo3pxUnZoQzVP
         rAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        fh=Z6m78q6NlOqr7zpO0obgPHhzZgEo8ITw/K+UwYmwmIU=;
        b=PARpz5/3Smf++2FmLo6Xl+OVy9FP+UFH+Y4gfwtm457amIgBIkxEH8LLdotoZK1qfh
         /5XtjJ52TNuIc2NJr6Ha8fGpowWOV4OidMNzEIRiV6rq2fxdx8FNRN2kxBoHrSJIMIJY
         lgXzkMF0pkOK2K/sA9v30wWWgtMlMjrv1dKI1dWOcU9UCaIT5HvFbjkuz9EbjOX0YE7D
         Yu3ldvDH/bEk1lEE+npNwFwBCsRrRXS6RCIGHlYhn8uTwTFh7SSdtqqGEaL6oUzUlaon
         sFGinq5E0D8KjH6ODjaKTXmbfym6/kAXQo3cEf43MXEQNcYEYo5RR8NUppa2sHs78tOk
         qwdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778846784; x=1779451584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        b=fSiedV18vZX5H2p4YPKZlEwU/SoXhfCPsCzsSNfNsmGjkOoXmR8dIfeM3WN5j9aL9t
         4KpWFDrQFhnX41E0YpXqS/+NCfeUDUkF97tq+ECtIt6DHNblOv78j0NVmQld2j7iHUZZ
         EQm8IO/SLpaxUGuBGtRkk0wsIzobUdj1s4rxVVkDcnvjD24AoKfkhPuBp+BOn0FIU6nq
         888m2oyu1fdssJzPpwEihgZ5HQyAoc7bh2hf+h39n8WaIfxH9wnQmOiFtASerLx5nU13
         jTtoXmFWz46bEHgsKv+E9htXUM/PBx79c3F2QeoMMso6dhYOru/UYibgmuqHCOGe5tEk
         0U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846784; x=1779451584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        b=IJYI64BWMZE5Ej16zYfc5i56DQOd0NVHYNhoqDQION2aenmMq6sJ6fif9fw4Ntkmc/
         270leelQC7Pf4h2BR4tF2XmQipqDf77JI/+hV2H+85ztUIuObg8xp64Y+p2R2pacOo3N
         0ctL1+hcDFu74kY7mQcJE33wcWEIsr+xahhXdIlCOtC5LwsRB2Yvtu8F2ueOLYAmHRt7
         HLlzbdkv+55/L15YgyON8lhR+dTJ0GWgGjAigmQDNbwmPwWa/FXx7rBJltDcQZkIcZBY
         KEG2mFdajh7YuIj3bPXHITI7tQxo5HEFX1xT0uSwpOmS+bGu8IL4yvJ9kIXOSENjZdsS
         y6gA==
X-Forwarded-Encrypted: i=1; AFNElJ/zFGEli39o/fV6sDncLY1T1JnVLb/r+HQHdqpoqW9bAgBIzlj1andk/WQTyUMh/z5krThkOZT4QqgGf2PMXt+2Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtM8Dzffdvzw7QkyJupIoUkfdR2bG3hI9w+tzrnUOnFhJhpK+
	dlRsvOpPLP05w2aTUspSSz748Ck9LdGF4xSWdFbtzs+XC+SVLQoJ5lFLr8yJylC0UMP4MVegNZ8
	KzkwxP0JhhK4JeVlP6XH5I+GahbiBIn4=
X-Gm-Gg: Acq92OFiNRyk/kKyUzNRJvpMcfziS4Kkxgmp9UuBeZF9VG5C3azTTm6vMKAzf765IZf
	HA0Yop/TnDua3D8NDt229MD0LhxhAsf7fOAJL1eeWoRfD5eLdkza22Nnbm3Epbxk+fORtG3/rrK
	M5B/CaSxI3tDluDLG1zOBii5vlRcg1zWUcnwlXhguHEzxlO4JY7Oz8pnhlC1qqJchQ4qw9SEuXU
	8oBWfJ8JkH9xrdP6eS/K1U11Lt/4C/r5sLrt39SdOb8aMuJNIh4rPclEimp753ZxdWlX3iGCb78
	bSL6fejpBpq7c+4JD7RR4b03sQzoCUyalS7VzVkZj7IHz4sIE40RSXK1xuidetXRfic=
X-Received: by 2002:a5d:5f90:0:b0:441:2397:f40f with SMTP id
 ffacd0b85a97d-45d900ec71fmr12258747f8f.4.1778846784068; Fri, 15 May 2026
 05:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330144509.258986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260330144509.258986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 May 2026 13:05:58 +0100
X-Gm-Features: AVHnY4J7iyFvZ1_OTQGwe8obo1L48yvwada0RoL4MXD5-AftuDdqfdQVOgBB0n4
Message-ID: <CA+V-a8vVhjFzuxKSLBG=WKUCnyih_8f6Ww2mJ=tUV8VE4mp8_Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: i2c: ov5645: Convert to CCI register access helpers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6FED554F8A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32682-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,windriver.com:email]
X-Rspamd-Action: no action

Hi Sakari and Hans

On Mon, Mar 30, 2026 at 3:45=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Convert the ov5645 driver to use the V4L2 CCI register access helpers
> and regmap infrastructure instead of the custom I2C register access
> implementation.
>
> Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> a delay between specific register writes, which cannot be expressed
> through the generic CCI multi-write helper.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Xiaolei Wang <Xiaolei.Wang@windriver.com>
> ---
> Note, this patch was originally part of series [0] since patch 1/2
> is no longer needed after patch [1] just sending this single patch.
>
> [0] https://lore.kernel.org/all/20260328132902.776757-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@lin=
ux.intel.com/
>
> v2->v3:
> - Made use of CCI_REG16 for the chip ID register
> - Replaced CHIP_ID_HIGH and CHIP_ID_LOW with a single
>   CHIP_ID register definition
> - Added RB tag from Xiaolei Wang
>
> v1->v2
> - Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
> - Fixed checkpatch warnings limiting to 80 characters per line.
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5645.c | 919 ++++++++++++++++++-------------------
>  2 files changed, 439 insertions(+), 481 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

