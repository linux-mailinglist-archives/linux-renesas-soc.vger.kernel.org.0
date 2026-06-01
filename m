Return-Path: <linux-renesas-soc+bounces-33401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE4tG0ucHWpucgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 16:50:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D88026212D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 16:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2997309B1CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 14:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A933BE620;
	Mon,  1 Jun 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfVplF3P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167A3B4EA3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jun 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324955; cv=none; b=UlS4bSmhi/uawmI9wQaAALs2kgnv7000UQ5g7+ltv34l4wynNJZehC1SjEEns535F2ibapXg+nzocezGfREDiCJFYZhJAVAQIsjuHSW3a2YvgOh6PlCGsx0uL3jO93aF028WAlDCje2l8SKtELNjrzP2vjQoPNL/JlNOBQ6hrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324955; c=relaxed/simple;
	bh=KwKEkwDhKFllduxQFt6dT+HKbaAW3P77Mq493+G7AAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNV6JiM9ieB5EY1+XsgMYE1Zp8LWBEtGtcwqx0/be6Y5eJc8ofME6gnvZHA9XGanVO0P1/fiThwbaVGqT7KXUZB8iXtmiGjRigVWgUioZLpPtR7qqMFDVp3I87NaDR68aEGJqZahaYnrFvQGUU2f/pay94a7b2fRtPYGIEKeWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfVplF3P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bea7176c72so83541605ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780324953; x=1780929753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=hfVplF3PmsPoQqwZhHw84uwWoUUcR0wwcT/kGW6BmfQddv7vCn7DCId8KAEX1/ubBN
         AFZ5FlwNFYyF9zGHO06WRF3m36qClaRkMERZvP6em5fLFm34C590b28M/fuODPuEEjbL
         sK0rEa9KRseEUad4xJAKOE6JKLWBS+vvuWwxihpRWCOb3ge79HQ+vOMh9pwhItdCupcC
         tMn3x9xF1dO04ykTM4boJaUYQer6RnF9CLDWNsgnqe2TabLbUTWMc10IQQVV3xpcF9t3
         zzmJLQI0vny597fY0PKUgZEgcM9vUrRHwPxmXfEF7UWfWtC5itiUGKotVE8GY+DUZjB6
         wTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324953; x=1780929753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0dhUfw0XKND2zjq9zxpBDoT9bHm0cEZAjiXz5KStSE=;
        b=a+pY2MFb0zvx7vmfXF2d5lYrCGT0J9B6/suIiDz1B+W3dxL+M+7PeJB3vcYnGfGN5/
         wtGK6+gc0xjByZmyfZIfyOevTChcOpdQzWIKWQRe1HxEAsJU1vh+iD+ETNhOIryWz4gZ
         wkFzxFAb+B5Tsu2Wnf3oOdva+A0pHxu4zx3c2hAwPxLOErvoha+F2iTzoQTaBgiz6nt/
         kT+zZVbYy/uhgmsBpQe7tCBDx98UXThdalew4YoZdJEYlR7iGAPpu3CUvmsgJSdfmvD2
         X6Em6obiDAn2la617DCUvfhR91B93FEBMs9ceoSQt1n7FRPZk/rIJPDi07Zy1jY6pASx
         SAEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FxPE6iex5cQESkC2zf+Bkvow4gFx/DaRRa7BBPO7/tPiTEb6dXHpVhbDLA+V1MPSd1qvFTwNzUDYQder/HjzLww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUz56dg7Chj/xywycHIxcnDQnmDi2pTFFGcA2NZbIcH6RJpHOi
	HEF99cyQ8rgWg6eC3gOpBJQuh6/yB0XWjgSGHW1GQn0vg/jxovHT5XAgNi/TLofjaSM=
X-Gm-Gg: Acq92OGRwljjqcBI4j5yIa5lxOppWp9SrzEl70iGa4B3Axk1QVjfEdIjLorzx/S8ExE
	E04nShOlD7u9JTiHxVnZq+U/FSf62mQNM83ZnL55i0vs/NbAv9kEnOInS+FW8uEVPzRwfVTf6hs
	zQQHpdPYMknbB37rw23ALTnjRuVYqt0AJixqFAMVN+jL/fsTZ2E4KramBsM7mGRuYpcNW+k3Wuz
	NAH/cjy8WmB5j5qkHcDHj5Y2k4ddIv5JdxXKO39x8Q4xLVZ8htijCPet3Rc8jPNN+LF4b/bNmof
	WPoCX3lFLWtBUYLmBgf+HL9qxZnk7L50lBQZpF4PfRYmm26vv84eeEaCCLEzRsKWYVRtUQwIIlV
	lTrmvldEH3KTA9JAUiyYIhFpTb8xrLuuNMC3rjQHP7dD/WhJpIWx0xx+wEtojVwfpuTmTI9LFI8
	Nq9nsGMP9+dzdTZVyPyxyCtzFKcx+CCVFX9UiqD0BQZISHSMn0
X-Received: by 2002:a17:902:e74b:b0:2bd:63dc:b7ad with SMTP id d9443c01a7336-2bf3679ebc4mr132076775ad.2.1780324953150;
        Mon, 01 Jun 2026 07:42:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:86cc:b476:3696:fced])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0842esm107038115ad.57.2026.06.01.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:42:32 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:42:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <ah2aVdlsLqy9aeHP@p14s>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33401-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D88026212D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Good morning,

On Thu, May 28, 2026 at 07:16:32PM -0700, Ben Levinsky wrote:
> This series is a preparatory remoteproc cleanup split out from review of
> the AMD BRAM-based remoteproc series.
> 
> During review, there was a request to move the duplicated plain
> ioremap_wc()/iounmap() carveout callbacks into common code and to
> factor the "missing resource table is OK" ELF parsing path into a
> common helper as well. There was also a request to send that cleanup as
> its own patchset first, with the AMD BRAM series respun afterwards on
> top once this cleanup is merged.
> 
> This version keeps the same overall cleanup goals as v2, but reworks
> the optional resource-table pieces based on follow-up review:
> 
>   - reshape the optional resource-table helper in patch 4 into the thin
>     parse_fw() wrapper form suggested on the thread
>   - switch the patch 5 clients over to that helper shape directly,
>     without post-helper rproc->table_ptr checks
>   - keep the driver-local parse_fw() wrappers and their existing log
>     messages and severity choices
>   - retain as much of the existing per-driver parse_fw() logic and code
>     placement as possible while moving the missing-table handling
>     through the shared helper
> 
> This series now does that in five patches:
> 
>   1. add common subsystem-private callbacks for the exact-match
>      wc-ioremap carveout case
>   2. switch the in-tree exact-match users over to those callbacks
>   3. mark carveouts mapped through the shared wc-ioremap helper as
>      iomem so the framework uses the proper I/O accessors
>   4. add a common helper for drivers that treat a missing ELF resource
>      table as optional while keeping per-driver logging decisions local
>   5. switch the matching in-tree drivers over to that helper while
>      keeping thin local parse_fw() wrappers
> 
> For the carveout map/unmap cleanup, this series covers the exact-match
> users called out in review: xlnx_r5_remoteproc, rcar_rproc,
> st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
> TCM mapping path is left alone because it also clears the mapped memory
> and is not an exact match.
> 
> For the optional resource-table handling, this series converts
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
> parse_fw() callback also builds carveouts and is therefore not a direct
> match for the helper introduced here.
> 
> Changes in v3:
>   - rework patch 4 so the optional resource-table helper matches the
>     thin-wrapper form suggested in review
>   - note that patch 4 still triggers a checkpatch --strict warning for
>     the flow-control macro form, but that implementation follows the
>     maintainer's review suggestion for the thin parse_fw() wrapper shape
>   - update patch 5 to use that helper shape directly in the client
>     parse_fw() callbacks
>   - drop the post-helper rproc->table_ptr checks from the converted
>     drivers
>   - keep the converted parse_fw() wrappers otherwise close to their
>     existing structure and placement
>   - test xlnx_r5_remoteproc on the latest tree with firmware images
>     both with and without an ELF resource table
> 
> Changes in v2:
>   - split the mem->is_iomem change out into a separate patch
>   - add a common error message on ioremap_wc() failure
>   - drop logging from the optional resource-table helper
>   - keep driver-local parse_fw() wrappers to preserve per-platform
>     missing-resource-table logging policy
> 
> Ben Levinsky (5):
>   remoteproc: add common wc-ioremap carveout callbacks
>   remoteproc: switch exact-match drivers to wc-ioremap callbacks
>   remoteproc: mark wc-ioremap carveouts as iomem
>   remoteproc: add helper for optional ELF resource tables
>   remoteproc: switch drivers to optional resource-table helper
> 
>  drivers/remoteproc/imx_dsp_rproc.c       | 41 +++-----------
>  drivers/remoteproc/imx_rproc.c           | 40 ++------------
>  drivers/remoteproc/rcar_rproc.c          | 41 ++------------
>  drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++++
>  drivers/remoteproc/st_remoteproc.c       | 31 +----------
>  drivers/remoteproc/stm32_rproc.c         | 39 ++-----------
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 70 +++++-------------------

This set looks good to me.  I am fine with the checkpatch warning on the macro -
given the redundancy it avoids, I think it can be tolerated.

Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
and Peng, please do the same for your platforms.

Thanks,
Mathieu

>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1

