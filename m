Return-Path: <linux-renesas-soc+bounces-34546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1EwXB5VnQ2rXXwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 08:52:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347D6E0E51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 08:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FKjhXOj0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2444B30097C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 06:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80AC392C27;
	Tue, 30 Jun 2026 06:47:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1EC3822A1;
	Tue, 30 Jun 2026 06:47:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802072; cv=none; b=gHwuPfXiYaAXwU7dIMCy7l2AGo9TfZBTJdCX/mEQaxgkRoD1NwomZW7t0keYvlgX+X4AcrDjXE4r48NeLbl36EEWQlNPW6rNwlZV34aKgophRduFCYFaYfC83SERLzNyGySZ4ZXW/WJBEclIBM9SytpOkd+vDA369lp173WtDvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802072; c=relaxed/simple;
	bh=rAfjYDmFjO334SlGnUD4ll1Qtgt5OdlU1pHochTedL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1q4MzvKyRClCnmXUchpn7N4YQbiw9zuEN8AWsUQJlNZHndJ5IvxmZO5eJu9z4oRSQ0zMSng7IyPgiTXQeVHerhNDd9Rzh6/6ZhMh3Fi3zyUGUwCVioZobnyYMEmd7schinHkzOGjdPE69QmOljp/z5hTNqbcnzMqam6aSw4yL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKjhXOj0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DBA1F000E9;
	Tue, 30 Jun 2026 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782802069;
	bh=rAfjYDmFjO334SlGnUD4ll1Qtgt5OdlU1pHochTedL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKjhXOj0vpBtzMvc0YE/njE02NLXZE7znhdXGVcvUHGnluCcGoG2ha65kXBMA7F50
	 MOPzQzrmNHTH9hXQEx/xDPyRECDN1v99ESbs3XamPNxsehSEQUfbcQKimYJBfW7eoQ
	 +XG133SnxThuzDZCSanH/Bqa7K0jrZp9Nz+41jeDyllTqxiO/0U8wiSY+R6iySNj73
	 TcILpA5qxNErPZ1LTDhKOfzRrTqgUSJuQen1bmRJOsvUg6lFKXLW/lw5/ZzNzsTHWo
	 EEWMbM9wQqLeILsyO1EQPXXFQxl9depht3LpRBlcZHn1A98bgeRFEmtLNEy9fISb2a
	 Alfj9NnubPoVw==
Date: Tue, 30 Jun 2026 08:47:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: snps,dw-apb-ssi: drop
 superfluous RZ/N1 entry
Message-ID: <20260630-dazzling-intrepid-lobster-c83db6@quoll>
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
 <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34546-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6347D6E0E51

On Fri, Jun 26, 2026 at 08:03:22PM +0200, Wolfram Sang wrote:
> Commit 164c05f03ffa ("spi: Convert DW SPI binding to DT schema") added
> an RZ/N1 entry which was not in the original txt-file. It doesn't follow
> the usual "<soc entry>, <soc family entry>" style for Renesas SoCs which
> was properly added later with commit 029d32a892a8 ("spi: dw-apb-ssi:

Does not matter really. It was added apparently to match the compatibles
used.

> Integrate Renesas RZ/N1 SPI controller"). In that commit, removing the
> bogus entry was overlooked and is finally done now.

You introduce undocumented ABI or your patchset is non-bisectable. Past
commit is past history, so not really a reason to introduce new errors
(and undocumented ABI is considered such).

Please drop the patch or fix it.

Best regards,
Krzysztof


