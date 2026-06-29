Return-Path: <linux-renesas-soc+bounces-34529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gNRXFbeTQmot+AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 17:48:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E26DCE9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 17:48:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ivuyIXk1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BACE531280ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620CC3FBB76;
	Mon, 29 Jun 2026 15:36:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A423A6C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 15:36:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747368; cv=none; b=eRHYr0dVzWz9qrXHwJ7WBAMA6KfSMH2mBeTkMaTBsQT1r31+oSiC7AnLYLPZHJ7LNgFUwYE7mDfGskrtBNV40TK44avJQ1BV0uQFdazrjbjJNtG3WkLa22nErastm9r67BC+rrtnQhc/Rg5lYMDkVPStvq7990+/I5KpfmY9EAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747368; c=relaxed/simple;
	bh=dPo8To4lMTniabQIFcwXhKUudpCTlGapUPHUrc4t7vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCYOI0QTghbwE038URwriY2oDZ9raaRiDFU+Vy8DDZuvLnMp0Y2qCSOJ+hBkDT2vdoPnWOHXs4E6VwdwiIS4th3iCe+tq8GQRKwNu+cp5tJDm68q+uWBl6BaTZkf+++1dqawQYVUaIz+F8/U66SQVC9aW5J+8PJt3TwZj/Jk+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivuyIXk1; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso11898875ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782747365; x=1783352165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=ivuyIXk1NnQNuMeWlJvjZkrpeKXoBAcIKz4Uj1WpGnzkY0BVFnf6Tcp6bDOgYiGKxl
         MiJYT6jhdY1KyRsVi1PuUAfmQj4Y9NpaQZ5WpUjRilfPUJ/D1oO8SAg/zoxLw7AqhH08
         g6ien+v33DrmsfxNIh6Aqcrd2ip35GTcb55tHxVHuFFUj6eYkg8NjHrkaePsPVQNVGXa
         PwGmaBStyxZqFKFJo8aMYYH5P2+64XoL6YOvDGbpojTPAdFvyG+7EwcWFWE2BnSf8O9c
         R2IuNBUwgOFcJ0wE/5EmkEOPMCIoP/ii6H/X8trWv0KZDXkUQmPvQU08KGMk764jMxYO
         TghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747365; x=1783352165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsiAkF5rnsXrEzna1iMYWZla+7JEf5EC3Z4oGTp3rT8=;
        b=ixfIQVqq/EebbNgApH3ajnIRD4cnakMj9hUjUthnQWD80UOHTqAjElCwbdmCg1BkMS
         cCFQOCmPNd14eJcKT5559tPgIsdTD7oK7xRISBHa4gkOOO0/L2YiaJU/KS8oaASqL3Gp
         zFZGLdI7VAwHVmTeEMYLDfr5UJL9OBMebxuwpbfhKgtlvyA0+OE23p8090eguOJFfQsY
         +2Q44j2nWnvdVJ0bz02ZPalvMlyIEqp0r6nehhPAjcRWlB2vEbFTjCStxxtFWzmUffOF
         V1M6HgZYEXwjDjWEX5cUhhEpyInqTYThS8hDgxefwuB7WDQErVVfZ3KH/AtCyX476rzB
         N2vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxaj9nu5UC9S7NxYXHVryNgQSBmrz1QsaigDiBV06tKkHKeoGu+LA/u7aoQDyAnYvRR6MkKhlEgTjQlMcFZokcyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BtnPzzl4iYodzVsgDm8qhPh5+F+GSHeHbUwiwDOASipDa1+s
	3eP2Oe4Yb0aKhq0M/R6hvAz4iEll3P//dhoMBa5bcAm2JHWHXUf4mDsYUTioaHq6h7k=
X-Gm-Gg: AfdE7cnei5QyjRvJXJLdAm5xo2bNqjjuQIV6eeLzRfY+B7EPG7oKtFqqJEuUSASPkDc
	aRFE+V7V753Bhykkockq+283JtSSxFPAbe5N59Eseu4CJQg0ChKGIbhM+yDpBWpPDJlWYWHRWzN
	diaulX5nDqK2QLZFDcZnypAap+eglUqj4yOfY4Hevksa6X2oZtyIf7GDgTCahZW/vEpOmhHP0hY
	jOSlTKvIPhebBL1cru2rKCx2D4T5J9LCYKrTJLIMsdN8SLuK6C5V0G+l7j0BJ7CprZQhBUiyoZ2
	MiOMOWVIesUFDgY/NVqN6ZGaQ6VyYfuWohHJ3v8QjTvoWV+0jawx0CuT1QX+axu7+Ktmv9JwJqf
	fGhNjCiiU3Z1uCJpvpQq4s/L/H4A8ko/+dPP01UfjppCkV1eJ0BJRLKJJq6MSuHF2+5frtYjLFH
	ttPy/DJxaQhfPvwE/apE+9dEA2mJo=
X-Received: by 2002:a17:903:2f8a:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c9854b5597mr89458355ad.12.1782747364963;
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:aa83:261a:68a7:9974])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm98408955ad.56.2026.06.29.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:36:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:36:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
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
Message-ID: <akKQ4H09G2MpRVGN@p14s>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34529-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.levinsky@amd.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:arnaud.pouliquen@foss.st.com,m:daniel.baluta@nxp.com,m:tanmay.shah@amd.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,amd.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,p14s:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B62E26DCE9E

Applied.

Thanks,
Mathieu

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
>  7 files changed, 73 insertions(+), 227 deletions(-)
> 
> -- 
> 2.34.1

