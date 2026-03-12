Return-Path: <linux-renesas-soc+bounces-29284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DVhNGbEsmmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:49:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC9272E2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05D7330107F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E8A351C1B;
	Thu, 12 Mar 2026 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiZrR55R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C582D97B7;
	Thu, 12 Mar 2026 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323363; cv=none; b=SjT67BygvpscOlFqcqMoo8J8ZX0ZMXdi4Wj0veCABCjIs0PAzCUaxJLrfzmlEX3vLZO7OYK9FnlMzvLY6zROx36oOGvcE976tl9WkoWaRlRbthL5uEj1zavT7k9Fhk5mi6e95ivj7qLDKfsqFh+89TMG4NGTmtq7tffgQb/tU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323363; c=relaxed/simple;
	bh=QDMPR7U4L7mnN7ggql5N7UaT6DsoORGTULdo7gqhKxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGQR/TfZkjoIqoas904Gklh5a7aSAqJgxjWa+ueX35eTdMSkVM5L1EKzzG5nPHTDOfuvNdhMJF0rvWPyCv463pI8soLcKCyf/O4vXQaf/XWItLLgAj1g6EhYR6QKjIxqglXEqMPONH1HRZvgtBsXRTGOdY7SPpind9qRuSAG3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiZrR55R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0473EC4CEF7;
	Thu, 12 Mar 2026 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323363;
	bh=QDMPR7U4L7mnN7ggql5N7UaT6DsoORGTULdo7gqhKxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiZrR55RyFPgwrqfon6RNjN+art4S8H/cUBWF1w086oZjsRzI1XP/wRBznlcPlxx9
	 qlGLdvtVSFX9BCA/+VWHxBKp/dAP+Y06TK1yAw9D518gKoLKDbxnWiDpsmV1jryt+T
	 oxzwd3ueEYatfH/z+lfCS1wQtASjujE9fnljImS/9FoJqamCjWklPuN9FXbh6cYeZK
	 p5ib7EA36vzAGQDqF6W7i11u95ByA4tA1xMPzRdXtsVl5x6XEf9e2ZR2aqNOZYRj3f
	 kg7a0kgjRsK6YflhdnZrsbuj3Zv9bLDDXtcBZTEZQX7cA1Zv0jDtGJYAc6dp5XJTxX
	 Ym1lqrWdud7Iw==
Date: Thu, 12 Mar 2026 08:49:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	David Airlie <airlied@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3L SoC
Message-ID: <177332336177.2902176.2580675840603611415.robh@kernel.org>
References: <20260304134845.267030-1-biju.das.jz@bp.renesas.com>
 <20260304134845.267030-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304134845.267030-2-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29284-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.de,gmail.com,bp.renesas.com,ffwll.ch,linux.intel.com,glider.be,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 75FC9272E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 04 Mar 2026 13:48:36 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add a compatible string for the Renesas RZ/G3L SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


