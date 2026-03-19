Return-Path: <linux-renesas-soc+bounces-29847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOOiBLGFu2khlQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:12:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B06462C61B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B0B3040A82
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 05:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BAA38655B;
	Thu, 19 Mar 2026 05:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr0htdfT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F638A71A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897132; cv=none; b=p0vigDdNjf+WCkFGYu+lMZ2TM7MSTPVfpim99vg9+43kgYz4dI9HQXWYLXVcAJmb014+Q50gikN2MukgjK3H2RL3KF4PmhJXM3OiNDUVZB+l82/9CR27tTnCg3LK9Aq/2iOmBalFPEhUC+IthH+FT8VfLsYaRo/K/J0ZJi0sou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897132; c=relaxed/simple;
	bh=vIW79JnLiLXSaAv76cZHGspHo3wFZfnh6SIto6S7T/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3zPP/kbknKFv+0FMFeJ5SyQhNCwKV7GP7lfWaF+0Kd4Zfv7IQKqu2d2mcSFd+Eg8JF9IL8ZzJQ2edkTd8uip8aKJUi2HhcVFGB3Q3HCP1bblX1Q2AzQ+EfmuS7xGpIZPSepu0zncreBH7zXlcskhUuz4yjUgrscCNTE7G16S1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr0htdfT; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1073789eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773897128; x=1774501928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqb9SO+Q6nFQgrXLgRcpJBL/MmDsCN3sih/lzoBOP1Y=;
        b=Lr0htdfT7HXjnl4oNCdrDa+tgBhjY5N6n2Kvh11tMS6xTlisYPXVL0byvAjI45qpFJ
         d5cUjfrB+e6DuMm+Iwq44nefDpzgwmT/Tn2m9HRzG/pQLYLveWWt+1Th4W+b5JYebNrW
         OCRCDdnXQylOdc+1NVxXLVrvbRnuMy/HLFBm+HsDdqGPpQXbMYIyyfEPCxCBZAK8bLqv
         3VBjuXHhjUcra9Kv6qX+wJfBysk/q+w8RnPK3PeiwmOouqmvz9f1xCGmMQY0V96eYapF
         +NAaJAeG06NGnSdxWKZGGsdwwDSTzXt/UfrLEko9IShK/OYMdG12NTmMK5mwtx/98Iks
         FlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897128; x=1774501928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqb9SO+Q6nFQgrXLgRcpJBL/MmDsCN3sih/lzoBOP1Y=;
        b=TeGBYLh8RAz7YjTQZY4ANOR4ro3w/9WoCWjezoFRw6bwZ5YLytZWFKP2do+fMMXkvo
         xl9sDW1rsarh3fuNGxjortdZ7IAh/k3dUqCC0XZDvU+DBvjqqRcfkMy/TdEPDigvh9cM
         zYvOPG0WjKQ8jLcqTjuWd8czxpUb3ZvzqRwLbfa09pIGfHzshv4b4hZMxDp6+iwPtX/q
         0SlsDn6A/459fzl7Rzj5/WSveFmOdSXMF3UX5hXcWb7Av6W3liq9uD30+rW4RdJCuod4
         1cQUIAidTZIOvwv0K6a83rwMrHkUWv+MhPcArnqMUHb8rytcbjUmbH0MSn5zXCoLaL+l
         FxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzhK2cq9yo1TtMNk4IZ7tuwF6CGzGDMJjw9XrKe0zCeTd0KmgLUVXMusnPkpiKe+mMsBFnSPuGtiaH8t+TUD+pxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2idFp5fjORMrgkoxO3OGLjYxVyd7HIe+QPeeamvMNyXeqSwg
	KKnNCSeT29nVJSM/ECI2H/WmyCLpVertl1m40bN1+zzuV4rgzRQaE6sX
X-Gm-Gg: ATEYQzxYHhcUVyAvksipl4Elg+keAgcnbBZC+HgSiajQnHk7AgnD62ltei0m6gSe6s6
	0ZDkLe2hrBd4j7RZ4mk6Z+6L8E1LY5Vyn/v5vE5dj+WwY9YXdxw4G/hbN0Va/u2K0R7qfxJaJmT
	R8W6C2XnorBz94Q+2j5kBH7SwXg51LFz/n7ffSgDC3ci9/KRebsBdrcTMQDDMIvtnaoEE3AIz5w
	ZfiC1Ads52mr8ANyW5z8hMogPt6c8/yZ2mF1D6z/ZEpjENbO+Zc/ktriOCueAn9yVD9rk9kkn73
	FKauTuzzw51D4cRYpXHAvOBVBwbUomBhESoj+mwdNMWmOBm+NpZE67de4S+H5GPIZ98LFPC9Vzu
	v1cvvo046ricgsKI4vzOe1WrM9dPv8KmrtS1t7sTCDaLkphFYGpz/Vz7QwSsO2vXe9I/sM6pvAG
	rSiNZnrK1KAONpet5zkqBM3Att2szzAuuwaZaoRdPcSD5c9GWmABfRGMReS09f8FU=
X-Received: by 2002:a05:7300:fd16:b0:2ba:85d6:e777 with SMTP id 5a478bee46e88-2c0e4f79dc9mr2238568eec.2.1773897128303;
        Wed, 18 Mar 2026 22:12:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ca0f6sm6652882eec.25.2026.03.18.22.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:12:07 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:12:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: touchscreen: trivial-touch: Move allOf:
 after required:
Message-ID: <abuFoZWWra-hVitk@google.com>
References: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29847-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.918];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: B06462C61B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:49:01PM +0100, Marek Vasut wrote:
> Majority of schemas place allOf: after required: . Documentation
> Documentation/devicetree/bindings/writing-schema.rst also hints at
> this ordering. Trivially update this schema. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied, thank you.

-- 
Dmitry

