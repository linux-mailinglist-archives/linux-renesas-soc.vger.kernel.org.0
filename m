Return-Path: <linux-renesas-soc+bounces-32266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEUQGmfb/Gl9UgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 20:35:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362D4ED80A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 20:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 632123011369
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 18:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B4246AEF0;
	Thu,  7 May 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyvhG/8w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545146AEC6;
	Thu,  7 May 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178913; cv=none; b=AGE55RXwM9YWgDXyOjIWDsg0ShzoTIGwbisC2fR5VSrgroYjIjJmekm4z6VvkpnGMZfWfz5LNV/caf9XMp/66qyafNGqYXZ9BjS6i2v57AE3we1V3h2854RYCiKAJ13iXdTFs8cpYCJZM3Ii/q4VmJmIRXmry7mNrtFQwSIPD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178913; c=relaxed/simple;
	bh=2qwF4RddrRnAyrCAFr8BPF3+43vyrgYxmXo6gc+eABU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ccy5azsQYbbiJ0iTA12tpcMAgiWML+zjMpP12UylhZddSuv+QWYaDjD45vCVjrjStnFUiYYkZRc5Mpq3Q4w+0CpCeXSOybFOqiEZBHk7mwah3l8mew/UQ+AcH4oPwiZ3M38r23cLWmOeSF+IL85cbISUdDYjrSyejuZdYGI8zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyvhG/8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B298C2BCB2;
	Thu,  7 May 2026 18:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778178913;
	bh=2qwF4RddrRnAyrCAFr8BPF3+43vyrgYxmXo6gc+eABU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyvhG/8wvWMPHMdKBgHJ5oNRsvhRmN/5kD9B5THecpmvMHWovjPepdEMUBuxXPF4n
	 9dd/ZtkkTiUW1SxjJqnfga7p1rR6ylNllgpJE5ROVtJrk87gQxvp82sF3f8Lz1+OF6
	 Bm1EY3YLigy/wJNn3OqFI2h4gqSWHBegOs5xcQ/KUW9VcuQBxMHMc+I12KMNlUK/2U
	 smBfK4QEkchZplTEPM6epYzcwXsyGmHsfJBsBO8bRj9Cai/9JuyVbsjPo9TX9Az9XT
	 fcGzLFU9isALC+WTrRfoZPOe5GPs275kF4g7qji9y9SeAw430gz4zWpPuHlacECy8p
	 445JqKkAkaLjA==
Date: Thu, 7 May 2026 13:35:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2N
 support
Message-ID: <177817891076.2225703.16510779686932087509.robh@kernel.org>
References: <20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: 0362D4ED80A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32266-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com,glider.be,google.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action


On Fri, 01 May 2026 11:24:07 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Renesas RZ/V2N PCIe host controller, which is compatible with
> the RZ/G3E PCIe IP and therefore uses it as a fallback compatible. The
> only difference is that it uses device ID 0x003B.
> 
> Make the binding title generic to avoid extending the title for each new
> SoC, and update the description to list the supported SoCs and their
> capabilities.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated the title
> - device-id value updated to lowercase
> 
> Note this patch was originally sent as part of series [0], as RZ/V2H
> support needs discussion sending this single patch. The RZ/V2N support
> can be merged independently of RZ/V2H.
> 
> [0] https://lore.kernel.org/all/20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


