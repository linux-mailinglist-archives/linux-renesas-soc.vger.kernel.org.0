Return-Path: <linux-renesas-soc+bounces-28582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKVBN5/IoWkVwQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:38:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA01BAE3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE49E302D1AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC2B3491C2;
	Fri, 27 Feb 2026 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faqXkrrx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrXfSlS+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE40348866
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210332; cv=none; b=PzckWOP2PbqIVOopdmZtzSh9cQSJBdN7KcjBjXNiJuVxZaFInUxByTouHdhvc0gUDug++n94yStyuyvWmvDpFKZFOfuI/KhpTxG99xbVBCUgV/ZAagM45DOacJcpsYcHiHoN/BkoUcXK+80r5OaUdsj/hNnLhf84WJFmIB/bBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210332; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhVU5r2WfC8bq3LUBctZPUa2ydOjhUKI6H48V+NAd4Mm7PLH65762+f9PnIE5+fwuFAmnNh6VlsGsyDFklBgYprBBYEid0GvlKP865bWIfNqnoOk7WZM6aDdjZhJG1mudr2hYpdolwP6BIrkRJpVqL2XV7CkHYSI5otiDpQQy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faqXkrrx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrXfSlS+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=faqXkrrxX9jDebOGqPS4po+d59RE5auZS4BLM5bIDiAroSemkTkgOwuETJGDwDftOpubpk
	8Br+cI9O8i5FtY2BxMGZYywT3OUxeM2e00hE0buMYnzatoMLaGfWOR+K4u1JHtdetEbX3U
	X/pOeYi/ulTDWhbANC1pLtbQuS9zZ3k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-hMQgLFE4O9S_A4QrT0Gmhg-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: hMQgLFE4O9S_A4QrT0Gmhg-1
X-Mimecast-MFC-AGG-ID: hMQgLFE4O9S_A4QrT0Gmhg_1772210326
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89546cbb998so213920236d6.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772210326; x=1772815126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=SrXfSlS+H0dalfq8l9T4Lj/ORePVPXj2NP2c0yYmqmAPH3AWVlwzZifxXgRHMHTgo5
         FFDRggYKjP2kp/bPhMOLKG9BqrYzyaKe7zoXcTgcKvWBx6VXg7+l9XwHPLksoolLeU2/
         PlylD5Wj4Ln/FIkA5GBQAATzVrK+382+eEpEZnMgIvtY/VkRkCKL4o3ZIhuAZUp17U8Y
         t6J3MQufJWHNq6uL56CvZ7n5Z68IUEFsCS3uthxke2WUfv0hhy81cc7uJoMAk20SVnKX
         6FUny2U8rFu8e7SMQ58W6fzSSUEn8pWAVPd83ZvVMlkpWUY4wUHHIUxmya8QvApqHy5d
         IQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=a7WCbPk+ux0ZrlFZlDTkYMsMIZnaRGw7d3eHMtoxKxP/3IyEl/R7nnEvBis870tCnq
         o1HvYkTPitqLEPnxBbHZWCftF/PTUNL6rdxgyzKZ2iM34MkkRjNGiygz4haUTShly8EP
         cgThIogI7+0V/PlUs6XWoOBHbClFtikQ5wK5mf0yDzRpV5ASgelPkBh7s1NZ3i0Y3x3T
         i6dEpr2VDYYoTTI0/XQQRtTTTZdkxorjABVWXkr/QK8H2p54SW8KUGJ4UFZ/DLzPDrCK
         rKAMSAVR7I+fpwQI7clkxIvDTcqa0f1J/UyZEbQwDerMuYKSepFuhJysuOuRLe+QiFha
         w2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUH7G349laB1I3cpvnyF5+y/aQvFpfikiQl4wQinTftwuaJ2alHqDO0gNKIJ47tnSWMXVQvUQH/ZOvZRHqtlTj3Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR2jDs645RrhhH8587UWUxU3L4Ia7HAfAh3UVUSHNe80Z5WnT
	AQ/LGffRTVTg3B0Kki8xvoZ6SZFfLpoAnKrbZYLPKKnQ0DXTNA3stX7hqCbaSn6LrbJBBSoc2tj
	Pu9NLukP7YOzIcvNwK52ewqREToai3OhsJKVvw9sCcmOJ5p0XPKDyHp9r+Na92CfTb1YMNnnA
X-Gm-Gg: ATEYQzx3nL9382+VZN3TOxJ+hJ+3jtiWWGzjL6ifjkbKppyfXZYpwfo0uvZAbnM57PO
	Pz5isxVqpgVdZDlUX2wTKYc2KoOGRtd79DprKg7dRsxvbwZcA/JKf3RAmtKwwZ7YVkbSKMQ0r57
	asWURJtsG2N/k5vZ2Wz7R5QQLk/Wtlb/W45HizVreGLV2Wtp1sKdW7Zel4n9t4Xdixy+UH70usD
	ckH7dNY26vd10mW8ho1qf3MyA2MYXeJxTZvX5J9q6vlUGPilk/Ht2iTFb6Zx9QP/4FOBL5+oNyN
	kNknFgtncP/CxgzOEuG9IitEiMlg2qtKozdnezpkI8moa0KxlLwxYzwZICH0qneCzUkPd0XQize
	H9HMHhPEpBfbGeoP0lmwST7qJKvvrNLam6cBiI43n6Wp5A/D/wiEIqW1f
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660216d6.8.1772210326393;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-28582-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88FA01BAE3A
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian


