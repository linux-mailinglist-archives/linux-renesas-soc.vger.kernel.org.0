Return-Path: <linux-renesas-soc+bounces-34671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SAgFHFKxRmr9bgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 20:43:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EC6FC3CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 20:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=dLBjCxcx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6563730409CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 18:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFA0368D6B;
	Thu,  2 Jul 2026 18:42:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE0E35DD1C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 18:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017733; cv=none; b=NT0hKvDUJrAO6VB0jwFMQblayuOOVXMarJzT8UsDrwL9lnVDD6wehPfY3fBp532gOG0EUhnEtZPUHjtoKCIIVbJxNWQoXex32/ifNtUMhsJlWNYhAQ+k1vKBkmva+VF1YVISN37b0UsXYaUU1xsE7kAR3AVcQdENxgIvJaLFlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017733; c=relaxed/simple;
	bh=3f1eg7xDhUtl74qSseB0uF+REXQfe/4ApWZ4QPm8z34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAPc5ptI9UPIjm3WcT76gXQkizQyQ+bHSkfDyoBtuJWG/2EBeQUf94nCnpgL1LM24MXAa/g6egQFCwYoxFmW4duJLjYQli9tQ9OYEc2ZAI5rIt5VdScd/PgLd+WrgW9/yKzHyx5+6dQBKSJjXeHkxd6JiLF/LLByFW3CbxJHo94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dLBjCxcx; arc=none smtp.client-ip=209.85.217.41
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73a75f251a7so825912137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783017731; x=1783622531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3E5kcG8MECRQ9InLZ8jdmT4IN0BYDghhEZtFSV6UR0=;
        b=dLBjCxcxVaFC+wX+lcNKofr8VanNjbPYY8rBV4dVrd4RRaPLISVd2TQNT01n2yXjpu
         fExf4T3C97LaQHy1WTddNZnFWmgpERUgJePDkLWmYNR2nSeEgD+oLkLgAy+KeWYsAqz/
         twgkjrgIm2E+8Ru/gwcLzrKCcxvdg+kRkjdlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017731; x=1783622531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3E5kcG8MECRQ9InLZ8jdmT4IN0BYDghhEZtFSV6UR0=;
        b=TTWhz1JWC1P1dx6KgcZffo6uZMu144/Sv9YO5sQhCRd90K6zqkXOlYiMdiW5xGhLjy
         7HRtdWzSiccJBwVf28sAFUmsh2nzYdBkBDcwFSVn684UUEG4EXDHCiiaTJ2pCLq29+S/
         lg6mj5EKrx9cghU/WQCafyjvB+W8V5yDuoHhD1/nY+Dq/EKhMXpAJTsexJDY2p0wUnro
         SOV4n18k2zyPmdHFfKqGsV3wUStHFbeAqVCSvrMH6XdOWu6A7HCwa5kl0nNOVRgxgK/H
         Jeg6rt6OOKqTK4QpBt1zxcBJlHJA+JZaj1FlFkr5mz5nG0g9d7s74r8CqnN9K/NMtFpo
         qgrQ==
X-Forwarded-Encrypted: i=1; AHgh+RolflhS0MXjkyRk2cfHZqPZfgTe8Io62QPYs5+Fj3WJZCdzuiFPu1obdTEND11LvGON462E0BjABJ1Xcmsdi7aciw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SrjYUZnaeU20qeevq5sn1j/ha2vK1KzSYDU6eWu1sINiIFMm
	R23VcPvElN86n2D7ZmB9Eg4GT2WTmnigE1R/sC546u8JjCLerx8Crj9tL6F0KFN0BmTSjSG6Gd2
	DJFw=
X-Gm-Gg: AfdE7ck5tdq3JJGXRjhXuYJj9QWu8NXU/cf2ebWFIwUmKO9Rvxo+p2JXnwOeNBFj/4L
	tw3fYfrjJ0KDJUiidi5TTQ5uIb6r1bFEV8Rb0SY3t0UImm7wUKmVjLKmSM1lZ382hPFx+ufbJL3
	o2qJbmb2VRIQIqE0PSOc3Cb20xbEvT6TOf0akNTgwUcWINXX1QuzZgPlLawyd37g7bmz4XfhOAl
	QO3y+TWWHiSoeZfl9G6AJkyWrFjCxJ4AtcEQ0VqC2Ta7kJi55BD5rVwVOnfhGLck3IWpdaKPzTK
	sQaLkCYFJdLoJHY7AGMiwd3+7hQF+t0tB3jYDEG703rW1k0m/CfBVvqClfZYsnOkGNNBtiInzTi
	rphbYC4oWldkL7FlCmipRf8RyrFGgmAy63qQHn8MgF4diEyijzZIHgONv+G7YcPLX4zrlXmBmYT
	xrMjQCNy+X/B5/+VD2d/bODAroUlg8YBwNmajDfLJ0rltWWYYAyi0=
X-Received: by 2002:a05:6102:3e09:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73dbd6070cemr2620663137.5.1783017730873;
        Thu, 02 Jul 2026 11:42:10 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1834991137.11.2026.07.02.11.42.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 11:42:09 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7387ac7d28cso682413137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 11:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorYU2tlgb4lgxNoTzw+oTFTQWJ91JAwMz2OgOI/PnLI+xEjKr6ROFa0PX9uhpl0Ijk/6NiWj0yzmePkvJweR220Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:737:ba2e:8a29 with SMTP id
 ada2fe7eead31-73dc05b5f94mr2611709137.27.1783017727894; Thu, 02 Jul 2026
 11:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
 <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-2-8570e692143e@linaro.org>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-2-8570e692143e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jul 2026 11:41:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VauZ=yPjkza9U0QEu2L6tMJb6BSC532mTwa-sqjRhAdg@mail.gmail.com>
X-Gm-Features: AVVi8CdHOFq8qwj17FSviMXPODi_RZqregPjBSkwFRL55bEIPJ8qnk_xiGuXBg8
Message-ID: <CAD=FV=VauZ=yPjkza9U0QEu2L6tMJb6BSC532mTwa-sqjRhAdg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34671-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,outlook.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:from_mime,outlook.com:email,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C0EC6FC3CF

Hi,

On Thu, Jun 25, 2026 at 2:29=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> From: KancyJoe <kancy2333@outlook.com>
>
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  12 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-renesas-r63419.c | 350 +++++++++++++++++++++=
++++++
>  3 files changed, 363 insertions(+)

This looks pretty nice to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

