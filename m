Return-Path: <linux-renesas-soc+bounces-32345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCRSDSyPAWpyeAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:11:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D966509E0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 492A2300BC55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD9B3B9D95;
	Mon, 11 May 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHo/7wVD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF73B7759;
	Mon, 11 May 2026 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486986; cv=none; b=VtTiYusIswwWw6QHQ+6rBzzHwYejHFq9vwwJ5sH8NX4ksgZNNHYHj4PKpWaIRidpSZ76Bfc7rM9C0Ed99WSkESJEWfs6CEq1lWaakXFjoIsicF6S55uEwBcz78W9RlBnE5sutrX5DTAixrHZrEwKOyEq1/naH3YBh42n1NW7b4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486986; c=relaxed/simple;
	bh=D5nuHM+mugpGQ52uN5n0jU/6pVfYhQKN2nkbAbZm+aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ss4uLNKfT5NdRtQyRg/lMWPIuZfSG0OIGaQ2fn9l9lSwAOJ8q4MLLw5vj4nDtMXRea5rTf35F1aurQVQAi89EYRXER1zF/Y20zQvFSC50YkIxSxFZlkRAeBigl1us+q+yNomfRs6hGpUoL1EKQUyqtCs7t+9wsbA4960e0a/NHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHo/7wVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9200EC2BCB0;
	Mon, 11 May 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778486985;
	bh=D5nuHM+mugpGQ52uN5n0jU/6pVfYhQKN2nkbAbZm+aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHo/7wVDARqN/DmKY5ZFWVrtLQ3RDTXa0iAJEzkvidACsVtMuPD6VtKXDOf1hmZPI
	 ehy+XYEyctdHURUgKJajWs6c52TuO4lTiOrlyszCpGMaVA/MVTiDZGdJ+zoXDVjnIf
	 jAd/UZMosPZ1bqYz1c2qDH9hmb46PlpYi1rEmuriNTn8F0CP4A0eT5N/nzJL7NkIcL
	 JIzBMKyMDG3g+7GqIopFYPbVWh1Rn7i1skmVTuobOgL/jCrT4xgj0V+igpRxONJvys
	 z56u6wSYv717DvEH5eFEKLhfGUBXHq35tiXRPMM1gKY2KgI+ieKM1UoNUEuJo2Hngm
	 4/TdyLNnOHB7Q==
Date: Mon, 11 May 2026 09:09:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Message-ID: <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-Rspamd-Queue-Id: 2D966509E0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32345-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-m68k.org,vger.kernel.org,lists.infradead.org,kernel.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 07:25:49PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > dynamic allocation around per-clock rates discovery: fixed size statically
> > per-clock rates arrays did not scale and was increasingly a waste of memory
> > (see [1]).
> 
> [...]
> 
> > v3 -->v4
> >  - Rebased on v7.1-rc2
> >  - Removed unused info.rate_discrete [Geert]
> >  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
> >  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()
> 
> Thanks for the update!
> 
> I believe you still have a possible runtime bisectability issue
> between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
> rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
> simplified per-clock rate properties": 04/15 removes the last setter
> of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.
> 

I have fixed this up by adding some initialisation in 04/15 and removing it
in 06/15. Cristian, if possible can you check if the functionality will
remain intact after 05/15 ?

-- 
Regards,
Sudeep

