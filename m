Return-Path: <linux-renesas-soc+bounces-34458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wb64Gfx8Pmq3GwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 15:22:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764D6CD631
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 15:22:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="B/Qw5rP6";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A35AD3021053
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759DF3F788F;
	Fri, 26 Jun 2026 13:21:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8F3F6C2C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 13:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480104; cv=none; b=K4h7psNRuJ0oCjcIs9dKADEESnxzFTtY0SJySUQYR8zIPOrYc4ulkEJeJupvYWpmxsn6kFOsEIVdnl31BcmJn2hOF0QP+lj0OSkqsDmVvMJXTtP6lj0ERUGvKrKoILh4uFKvD1xEMKnCoAOB3wBSoAgWj3Lm/fUHbzTmDSL+vx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480104; c=relaxed/simple;
	bh=pDPGZpvd3IfjOFyuEjSQA4JA6xmoXsUV/fcdGa6NUG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EI65dc6zV0FhRZN8ndPQYdbde34Ef4ve8jLRPtpaXDUzxlqCAJDjeA3ll36yHjQtKKem7DvNEgj/1/uIhjTjDE0TBYuYcTrg7WCceV7fibkSTQCML2iJq0l6s1kfDJRfXRpQpXdY1xesEfF/jfJs0SX3wBR0uhZdiO6CojDuYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/Qw5rP6; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39ad9ab668dso379341fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480099; x=1783084899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=B/Qw5rP6P9E6vM8O7H5+9+I55m+myjGt97X7hm3aQv+YJIVxJiW/ss5TV+REMIC/u9
         XeQIxLgXiPqER7xHieH8EoLAnDQHPl/a53LrSm5vvOB4NyYn++7Wc+3SRyJjCitTeE1k
         WJg5+Kh4VCWE0pVL6/LuDVQlIWZbS/ggFD4IJK0d4z9RwkGsoCNB+pHbqnPhiJWqNxZy
         CCVzYzvxZFIJ+oAWwr2I5T3nEch+GqxTu2g552VQtIBSG5qe23Mjcq7nU+7i7lQ6sBm3
         gOD30L7a6LJ8kqSxoGZWJCz6HiyLeu8XqG8BNMhy+iKjj40bTcE//+P8w6pFCubmgCq2
         P0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480099; x=1783084899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=fvhCzE+DW3H0JsRvMuOlKe/eHOOML5/aj39puI1Iw8Th9gMAqyRR5Dlng5Bg9FtKNt
         CxfgOQAFTnxKwKFfj7FHjEggqITYS3gCoQ1o/oWnI6dGeim8n1/T5ldp4a3p/thmcL4H
         8oUaaieyd84lrbv8Fm2HFJjhHhVEgBlrBx0wpUVrg21xe06jXJjevgm4P6WOKLR113g/
         qS5tsFnuFxbnXSXAvz9dWZWqc3ZoJMIZLDLhU/IlrgPpb8HaG/NQ4n9onevCeDLXss87
         +fviXt9xCOGF/0ytP5cET8GO13au8rR8Z55EEf8B5onjydS1S7dHaepjMvwNDR6IJXx5
         R4og==
X-Forwarded-Encrypted: i=1; AHgh+RrrSg9m0fJ7Zox2NFLe1BHxOSg3ZB/MZll+k2OSMML3iH2YFOBpiQBL2taDdYSswkuY46fPL/ulF6HD/SaqiU0CBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJ+CVNCn7zd3Fly00dIJswZPp8RfeWPy7+iI0dQAQUpablC94
	W+gLfPMH1YaR41qb0+acgWiCZS/iMxwDJRnhbH67+hVC2SXscQOBKlPPiECtCBfFMJc=
X-Gm-Gg: AfdE7cm+4ANKRh+7ApBpeAzTrfl0ahI35oBjkYWAVDKbkixhmk3D/SxZifr/Lfpufsd
	JVFxP071lHjoaRjkNHd8+2AX/ritk/j2i/+7n8WYu8nkNa9AvU7eGLmpOPdpWltOurTGVeaEBNJ
	H+R7EEnators8H4OPWCRxGhle4cJy3cBDWeGWnVCraaIkkmDtowr3LZrVi09q3/Yh3Xlyd6cmuW
	x7DIOSCICrCQUe+LSpM5QvefQWX9RakoeZrenXUc/Ks+i/G6xPr53ssP5dNZsc69T+qSYUW2Oyy
	CcxO1H11woD5Fi1c7mHXdPB4ErzYSpytTvNr3bH44TuJ3jnBhu04PTWhDOY2l7uZy5K1SopL5ge
	B/j2JtipbxNvxz0i8AnH6MuN0eB9YIpe7fBdis82Yk46pprah/8jX5hI5WdusnyVQObeFcQoQaU
	p0xC12gDD/m70Wt8Zu5aYlhbQ3JQEbHSDsWOFUN+rKXHXIhjrxFJJ3glu+67/LeEIqlKxhiFhlS
	z1YcA==
X-Received: by 2002:a05:651c:1511:b0:39a:c9d5:3c65 with SMTP id 38308e7fff4ca-39acb97be3emr7979051fa.8.1782480099479;
        Fri, 26 Jun 2026 06:21:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ae2613f76sm460481fa.30.2026.06.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:38 -0700 (PDT)
Message-ID: <2f238823-d340-4cad-b6f0-24ff86ff969b@linaro.org>
Date: Fri, 26 Jun 2026 16:21:37 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34458-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,ideasonboard.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6764D6CD631

On 6/26/26 15:07, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>         The orientation of a device (typically an image sensor or a flash LED)
>         describing its mounting position relative to the usage orientation of the
>         system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>       $ref: /schemas/types.yaml#/definitions/uint32
>       enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>         - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>           # defined as the opposite side of the front facing one.
>         - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>         - 2
>   
>   additionalProperties: true
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

