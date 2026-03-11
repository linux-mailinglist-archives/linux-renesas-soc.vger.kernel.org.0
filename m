Return-Path: <linux-renesas-soc+bounces-29193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFB6EytXsWmGtwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:51:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38412631CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FC61300E246
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DE63DD537;
	Wed, 11 Mar 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xytk/hOv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8283C7DE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229861; cv=none; b=EBNX2z+bbHYJPGznbcROaoFYcYTH4GOB7wiCq4jaRXl6NUG7lF4RllcYbxovqBnV2Hdqigqx5QZ9xveJIwLYZ9S0bi6fDRUbSA3K05W3d8sD5m1c/zIeKq5G/yBzir5opOC0nQZX5XQM3ommVXcv7knkJDM3gHNsRJllVBsc0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229861; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S28wA98c8sFazZFV5966HrC4vrl7MZ+joCOz1k2USt0z0iwzNoQOwZaH8GrPJisrJ4HWe7FZoUEEXaJe5QuZvDacqy7/jGXZ4OS+JDc5oxuWQ/5psBZxPLA3WQMWrvuBOcuvPs7XrK6k7YApyJR2lU/qko3y9t5dzp5NXdmpFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xytk/hOv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso7956669f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Xytk/hOvDF00hrRb0Yq/EusNd26162BrDBGz2sWnSbsSk/+p5rD5lLSiv2b7PY5urb
         OPxEL64A57Qp3tqmHx6KHpff3lWanqPqOt6l6tPBkP5HHBIgcF2r5XtAqpBxUd/dzQ9s
         j8O0AxVKizDNhSup3trigc0CmMRyu6gMGCNJG485cvPol3UbXCAo0qF7FNjwdwlXG9Jd
         FOJ0RNuKWnPNUOKDCH/SjsV9ui4Ashli+wXyhZGNS13kvud1uCiF6oc+va0QIjDnBv80
         2ufQgvlo4GMbOcKvzWmgaoot/MIUuD4DKlHSPgK0nLM5dT0nAerncHzQYGITENEwUbqH
         /CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=P2x+2UX42uL6SyoJkFQilFrS+EU8dkp7LdJJe0++9lprmHGPKe9GiH3vNsV20POkX+
         +1oet/AkZfSoXZwQKov0we1vGZaZz5J5OiT1JrF0NGCzcntk7aRG+yRAdU5vGYmW/4Uo
         NavdMCxaculGZo0MzGuBeMot+0DWj6doM9fBXp9oANlTDCl9irP67NKX3eV1bvGtAX/T
         6nXDNwNe5l30CDZ+KO0XRXSs18e3g+8tN3H2cctxhcnMBWlQqN/RhsGFoYhTWHHiXCuj
         cwPjw/OlPf8dzJjWh3DdKy0BrASXdlwfOcVd4icRI0/fVmB/JGNp3YV/YN+lLsxDEkbi
         a7jw==
X-Forwarded-Encrypted: i=1; AJvYcCWShLTIh54aExyLqDYDeS3jFhWr2uI8BO39Lu2BOtKdfj6aWvMe9EG5Dv7NAIjKulJK52pZtZJ+z6I7IfFKIO0zcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuvgMMNNtgvtcVJzM4QV2ug5SCDWg2D78bNivBYPJ7KJzq0EkH
	cuOKbQW7bQDQvOFLqEhK/QcGA78qlKuSTccbLKQvOybD1FOtXIhKsqUwIhbsmA8RvIU=
X-Gm-Gg: ATEYQzyzJNa5j0WR8FkqNRvKZWbUUxQZiXu/9FrsfeBXEebvXabaf9PtW1Z7jRTASUp
	Y/LhD7JZ5oQf4XXuCSYavKlAp60OAFJNG+qpFyhQENBRcdqrHF++F6XVipQABUEtNjkljQcr1cl
	sVJ8LHohXExrTlALMfbDqC3CnL7LxjkQh0S4Dlz5FpBsVtA2FjTy5LpEMYPdrI11J1uLYHyu8S9
	i00EX89zyI7rWlXU1gz6YXttkZKhWb+AEyGMMOzSLJx5otyBfspb5GynwTJNheEKZ+/jJ0daxw3
	bwddUkNvEgZODdL5CuODOv3xi2+9w8yalS/4r48X6rLP6+CKxNtSlFcsuyUVcvnsYq9q5qTsB0i
	ajOgu3QJzrILAwM+XryVmmxgqQpzDizZQ2YOV0Gtmiy3lyggQsrHo2cmVfSE+YHfgXAjHB5hVFm
	XWzd76D700EBmR0v1afCBTFpk3Fvihjzo=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A38412631CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-29193-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tudor.ambarus@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta

