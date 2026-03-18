Return-Path: <linux-renesas-soc+bounces-29745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBL8ORNvumnRWQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:23:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5A2B8ED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B52E3305C38B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04A33A450F;
	Wed, 18 Mar 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoWoerTa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D439E191;
	Wed, 18 Mar 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825468; cv=none; b=AYmNKaQIw+UZZG+BIrYMZpfeT8rKruQg/Fjk459KWSBiWpvzhOcfHfHFhOMe0/Xsc/EHiEbL6UreMWdszfXqqZcZlBrk5njsxV+WdLFUfNoklUDp8X37VI8TtA7y+vsOrhOXOULTdEJ0bYdDuyaBWfzS/tisnjrYrWmT3bY4DIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825468; c=relaxed/simple;
	bh=A908S2YSo4mX+FhuMhPRgJGjceaxECKjvhHfeEy1V5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGy/bSb2azlM9k9TaMs+1mftTSBx88QTGT+FI/PrYdJTIymodU6WFCdrSzRqNtrEIeFes3x1Yy9t2q6yOhd/mF40Qd7heo0mAf4pBu+th3jtCgtbFgCBSQLaIMEBfQqutQA5lt8HQ+np5xKH5AgrNl9UdNx5Nl1kWoS/FnJwsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoWoerTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF50C19421;
	Wed, 18 Mar 2026 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825468;
	bh=A908S2YSo4mX+FhuMhPRgJGjceaxECKjvhHfeEy1V5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoWoerTar3QIynUPXVfmE99nxFr1LeosglXqfKihIn7PUosypNWtL9ModC+i+pB6B
	 +dPILDFs3479Xnh7zLru3B04YZPHc6O386kpxfT0kOFsB79Oun3X5ZtXFQBZAi/b45
	 z9HdOaY46V6E7boXMY0k9GKXQ6/WJCvIG1EffBDkvA1Oj6evPWyoYSGaXYL6vl9O0E
	 q18u3WkaN7LObUS/eV3x/DZ0zxbt+FA66zJqSmmJtFapILVhHBt6BdkQLQ/sqKBtpU
	 MtfyFeEmyUl0ZjTK0sAGZo/C6W28C+jXRDWkFK37EjSZmlQEUqKzTvtQrCCCNz6tjm
	 b363sJYMQH3vA==
Date: Wed, 18 Mar 2026 10:17:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <20260318-defiant-rapid-quetzal-6f703e@quoll>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,glider.be,kernel.org];
	TAGGED_FROM(0.00)[bounces-29745-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: 1FF5A2B8ED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:06:34PM +0100, Wolfram Sang wrote:
> Add device tree bindings for the Renesas Multifunctional Interface
> (MFIS) as found on the Renesas R-Car X5H (r8a78000) SoC. MFIS includes
> features like Mailbox/HW Spinlock/Product Register.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Checked with 'dt_bindings_check'. Family-compatible values are not
> introduced here because MFIS is usually very different per SoC.

Ah, also, you hit 2/3 combo in your subject. You only need third for the
bingo - YAML.

A nit, subject: drop second/last, redundant "binding documentation". The
"dt-bindings" prefix is already stating that these are bindings and
documentation.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


Best regards,
Krzysztof


