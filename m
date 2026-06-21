Return-Path: <linux-renesas-soc+bounces-34273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Uz4LaMYOGrJXwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 19:00:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5766AB4EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 19:00:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Pa4xl7to;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDBF2300AB2C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 17:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D64E25783A;
	Sun, 21 Jun 2026 17:00:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767751DB356;
	Sun, 21 Jun 2026 17:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782061217; cv=none; b=BuNX+FdTm9GKaAg2G/7ed4HsxBt2/1LeTuZ7kesWS4o6ONn3Z7h9B+fZ7/fup0uWT8SSbeTch/XSXs0nG2anwhe6bDHrEjDIW33dyUz7spyptIkuhOsBAgSNpX8OuBt2jlUpOTy6Oxs8/JnAFVQXPlqxJRif4b2WVF2YR5GziIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782061217; c=relaxed/simple;
	bh=kEVoJ0bmpyznG/CstwJVr5ZqY99y9/g8Rw3P55eq/4I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBzNPcB7vy6o6xGD/2p9ZCbVDMAESGjv+xIiWoCu2Gx9gfH3jQ3bbRzm+jB0ZI88IN2zWGOZuc+aKJOzL1CjXdnoTasnhDsADxplk9NjJRFcz500CN5/h4Qv4O7YAWz/qbbx0B/eDKhB0JaTKylp81riuUfSQUl5WRt7sFp24vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pa4xl7to; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D011F000E9;
	Sun, 21 Jun 2026 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782061216;
	bh=LT13Elo8cXGba8BqA/kWfaMrSK5k41Vck1P+Ko1QHQQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Pa4xl7tol/v63GF2T8ASzF+LpWLJtVcR3Yy69o2uBgQXgzRWk2oU4dfPtVwTuZvsr
	 /gLPHtRzbhhJp41xZhV5E/xTPDsHQ37rAdjOQ7rmei4vXA9ylcw7K7D6qxwwUHJsA/
	 XTcR/7QqGEwUBWzQM+LEbP5aMIBhb5ePryNvP+uWn83JF4aF/sa7YDrPRi6Wk30eNb
	 IOSnC7sxHOZxdLiWc3ab4jWf7r9DGMObQ3Ow5CS2ALtbPpWpUDdEm38CNx0HLrpiQH
	 75wFdU1TKXNSS4cN5jVtP8QrexbyQzp9vO9Ugt80skNx0RwINYLAYKFgSVV82dKWc2
	 uBgbkEZXlKuXQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wbLWo-0000000EhsC-1O7v;
	Sun, 21 Jun 2026 17:00:14 +0000
Date: Sun, 21 Jun 2026 18:00:13 +0100
Message-ID: <864iivsuaq.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,	Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Bjorn Helgaas <bhelgaas@google.com>,	Catalin
 Marinas <catalin.marinas@arm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,	Krzysztof Kozlowski
 <krzk+dt@kernel.org>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Manivannan
 Sadhasivam <mani@kernel.org>,	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
In-Reply-To: <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
	<20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: marek.vasut+renesas@mailbox.org, linux-pci@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34273-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5766AB4EB

On Thu, 18 Jun 2026 23:02:01 +0100,
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> 
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
> 
> The quirk is keyed on the combination of the GIC implementation
> and the platform identification in the device tree.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

With the SoB chain issue addressed:

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

