Return-Path: <linux-renesas-soc+bounces-30374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFBnJgVUxWmD9QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:43:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EE337C5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAEC230E7664
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8540D3FBEC3;
	Thu, 26 Mar 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia0N599X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6083FB7D4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539242; cv=pass; b=fV2x8sAUE0bWIwpgjwkA3VqIhuFy8aNvQJx5r3qjfOB15fbZd60z0EZFr3kKqvhW3AkKtF+7oZtAToz/vIsdZ1peiFtG/qCQD2e40ZAYGkk4TfnWCQ+ywawaSkMHA9287UnsP/Kw+A8poNFa2i3berz2ihwG6DFqxOESJb7zbmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539242; c=relaxed/simple;
	bh=QHDDHO4LVVYxJRc2Eubtw5cGEKghDTKOLbul4jNp5LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/FLBR388k8UP2dBwbAUwJaVUIeqS7mi2vftstHb4lwmISLqoB/wJH2MlBgKQ4uMw4QzGVJbq/LxMyVHE/wsJNJZF4WQvKTVuZR5AEoFegD3Bqp85mqJKbE9aHB1kDlPQJnHO/paiMWgbxH8394vJKGXoJMfcADC/r+srIQWG3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia0N599X; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso10090835e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 08:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539239; cv=none;
        d=google.com; s=arc-20240605;
        b=bMkrugRQPgvYXQQaXBQhv/zKYleOv2mZWm1QliJ1n9eacAj+VGO0NjH1lJb7NyjJvT
         80kskeFSDtm+zxzz7zims3bFH5cPxn5K0CaMOQzRUcKjJOenUDI9zmgFXVUvU4ANmCq/
         yutS1EU/Gs5sZIBxOu/Q3hJ/VYl2ePRI4b+lLC/xr9zUbJSeFSSiPrs5hYmwzT6P2sG8
         iAqUxqDO2bi7llp9gzN9lOyi5CP0wYE8KmElI45kiAskxzUbNiqoEFMt3UWpDzVTDSrS
         z751n/HDKGWlA+iYFpWLJo/NfxboRSqz7lU8r+j1wMUGfSt34zojmDzLbURRwUxeizxP
         6/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        fh=jeQ96SnzcVYQdoNsLr9HFNAnLe9VPcmDHw4uqBPdxOg=;
        b=D+/EGdgFfJE7UbnErYAEBpQ7+cyL7quILpejIbj0M1ImJX8G8DqHHBPmwi/bvovRtL
         81MHuqTVLxVLey10MOtaPtHwuHh7Ck8pBrUChJmm+vcgYO83qSdAxQkX65KHQ/lAUBfp
         RdVhuUTXNz9tNJtxdX41ZqWTUNwxIQuV0kAFlmOvhQ0W3xtlXnGOyrXnDnWGKEnN9Dhj
         8t4RcWY6aGoWewg1Yqux8YiuGMvqbehUFt+w3BAWHROqXPZpymHdiK28QbNO0DBa+BaQ
         u4ee7iikLGiVaFgyHQ54nx9LTQ7AC4xBPR/m2CxDeYkCiyedwrUCvTP8T10476epNvgr
         YgBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539239; x=1775144039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        b=Ia0N599XwSCAth6j6XXDtr7IRFq8tBywK/o/pfogKyYDFB618LrYDe0fioAh/6Gjtd
         QoTRqBCdBWLrgyezNaM34SGYrJjVeVTV4DsdjJ9etTYZmB+wpUorcqkCn1SsnmKdMAZA
         8hRWXAOGor/0/wZKZXNVve4/3YctGvHd+AI5ABZiaLvwilvdg+WQ+Q8Ps/noR2xTsZoO
         2CqksOFDY99mwBTXcU4isR0rQ8cbhmEcDn2YKVZwrmNYWMcX/9rGBSbJ4PCAV6vNm6Dr
         xUrHhLyCJznlhoDkB1R3YogOIFWhjmNRwuWOM3TYNDv8vnkOHbMhfotTIQL+0ncvF+Cl
         qDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539239; x=1775144039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5UOQ2XgSgA9XitChwg3fQOJH1UmuYoeUNuk8tCpCA4=;
        b=Pq6Amfn6RhcdUBb6ao1ffvtrz7EoNxt5H1UMmlSnUlySQoi3Lzx32/UThP3S43jhzW
         lxlBpZC25KN3Eo+sOX/IbJNlRVI/iBxFOsVFU87LZFpudnRAYmauTuSHijX4U8pu1yKw
         QSqY96M/6LdOJEfR6Q818CUmMRpo6it5hVzkHCgIkjVAqV+rblF6xDLvbD8ehkKn/wW5
         DgaYI+5VGffJ+q6r4o9en1St1M0750SPxNiuY/uuHivfeKqj9DSeOw2B3YW3A1mOhf//
         7u5feGomzrDF6ooE03/ImHRzALqJDDzB5TEbSwV2tMH7vdXoWK4EllkRhJVUH4TZTQKs
         xOaA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ag6pCZ/VrYOkC4lIVJsKp8rvmBii+nljgXtay6N49S0w1/RYaT4lwRZimca5UiapSNS18f6ZEBlWtI1OxXoWaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhzr8pn1vhEn0mo7tAbfGW8Tg5oBgjsN752hJwdKesP7hEMOg
	Y75h+1QJqe2fCbModMrl56Sz/BPqdbbL3XDr4Ax5U1h5jU9mYQ5Ltann6xPJxrKIwL86Nt1G+bH
	a90oyjaIDfivO+7VHr7EdhIEuABHezfA=
X-Gm-Gg: ATEYQzwZ8Z+rAhFRSHcl27Kcz9sGqq44iEf0ychStrYY5OpABrFTrg8CRvoec6WOiXY
	k/tCDrqdGJMn7C9chWnDl8HUvaNzvcFA98VJ/2XhtiZRFR63TlxzUKmnmTCnQ9mSGNTlkL4Yv4s
	gDVVZ3g4mbs/tvsYTHXAtifg1P7/xml3Gt46r6a/FRQMkuL4m+NW4W2ylGmCWlpgekHEwZD5GNP
	2Nn8KEecr8oq8L+wZzMf5AORX5VuMZXjcKPr2NLI1sG/gBJNjEWv+E7mdYSsXovyPtKmV24Xz0s
	LYqt6lT9HzcJbi4CH57q3N3yPShtJttf5bFd40Rs3aYaGiKWxvd4S0VZzr61KQRNwfWg9w==
X-Received: by 2002:a05:600c:1548:b0:487:716:2fa9 with SMTP id
 5b1f17b1804b1-48715ff7a16mr134430615e9.13.1774539239050; Thu, 26 Mar 2026
 08:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326142107.297811-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260326142107.297811-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <bb172420-e19d-4844-bbd7-a6b6ef5dbab5@windriver.com>
In-Reply-To: <bb172420-e19d-4844-bbd7-a6b6ef5dbab5@windriver.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Mar 2026 15:33:32 +0000
X-Gm-Features: AQROBzAn9bGjSA_U9-7Bi0VG3hKZ4DZaBmDg7pB_PzCwe24_K7xtnvK7QMBK2-o
Message-ID: <CA+V-a8uuT=GEFGQXfXPc6KzPqOdTEjUxyP92f_YUzBq9AzUKVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5645: Convert to CCI register access helpers
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30374-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email]
X-Rspamd-Queue-Id: 3C3EE337C5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei,

On Thu, Mar 26, 2026 at 3:00=E2=80=AFPM xiaolei wang <xiaolei.wang@windrive=
r.com> wrote:
>
> Hi Prabhakar,
>
> On 3/26/26 22:21, Prabhakar wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert the ov5645 driver to use the V4L2 CCI register access helpers
> > and regmap infrastructure instead of the custom I2C register access
> > implementation.
> >
> > Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> > a delay between specific register writes, which cannot be expressed
> > through the generic CCI multi-write helper.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/media/i2c/Kconfig  |   1 +
> >   drivers/media/i2c/ov5645.c | 901 ++++++++++++++++++------------------=
-
> >   2 files changed, 429 insertions(+), 473 deletions(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 20482be35f26..921186d36589 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -526,6 +526,7 @@ config VIDEO_OV5640
> >          tristate "OmniVision OV5640 sensor support"
> >          depends on OF
> >          depends on GPIOLIB
> > +       select V4L2_CCI_I2C
>
> The V4L2_CCI_I2C select option seems to have been placed here on the OV56=
40.
>
Ouch my bad, I will fix that in v2.

Cheeers,
Prabhakar

