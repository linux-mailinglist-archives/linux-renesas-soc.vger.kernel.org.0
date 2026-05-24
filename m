Return-Path: <linux-renesas-soc+bounces-33056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC5tH1VSE2qB+gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:32:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75B5C3B7D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 21:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D8B3007359
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 19:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6BA3148B4;
	Sun, 24 May 2026 19:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5ITfi8b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97231280C;
	Sun, 24 May 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650982; cv=none; b=pE7LEWx5btBi2UDM1OpsObo6IpGQ1uZfaiQh7NKJ5Coleh01Q3nGCpGBvbojkg5ok97rPIyZBlFgOOR34+ggjtyC27fhsQCKoPmwkPQh3A7WnCxcGso+PXXrRK95BT3FPMh8N5eIL8SNtYlmdeMdVjy4rnBnouElWcGsfp1i/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650982; c=relaxed/simple;
	bh=wImq6jKuqYqhDCu5q+ahPfuCrK631dvNC5EDpZdiv0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ftvrjRTf/dQ4Cdllu8rhQ9vLKrrE4Z9K6InqbtVee8SRFMZdUWNaRxG8phZT80OC1BRmTeWrWf1fR581dea/EaYKuShc9/yUDRTqxXdnzaOiqeV6NuGDFzR3lIsCDFGVbcK6PV4OF53WZQLDjpfJV9cRKBl9f3siryLk1aEp5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5ITfi8b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2181F000E9;
	Sun, 24 May 2026 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779650981;
	bh=p6+qkxAZKqBDOmUVVqq9TQEE/gac+Mmbpaa2SUZOBQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D5ITfi8bMiDS3Doy2+j5EamOgfAJifqodYgyltWHxWfGQViSs+Zh+h7uaM4s278/P
	 0nLEP8apapyd8FEKO0T4ZiIGFiRUtq3DByrsLu1LyI6W1zK4Px65RlMnThKzHBSD8c
	 g9XVTPPsbOPvf0ACBfVzuK3LVrkzCYg2VqJReTBvnr08AhphXKn6tQKDwu4+ms7bm8
	 5KjJa0T+oF/U96QtTLvT0XYnkFUbgRy4+PV/WrZaRE8Q9pIc/QXtZKVUc1M+eY9OYg
	 n1rMaRKBsiDTeP+liGwBx0W/aF9vp5ISQi24ZWEfupniznXlbN1WIG4yPGOcWRaszY
	 GMKjOO3VfJu8w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Message-Id: <177965097904.27165.1581576321825641919.b4-ty@b4>
Date: Sun, 24 May 2026 21:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-33056-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: DD75B5C3B7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 15 May 2026 12:52:00 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
> RZ/N2H SoCs. The xSPI IP on these SoCs is identical to that found on the
> RZ/G3E SoC.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a6954060adc9d956a99f909f46bf9fb0348c4fa2
[2/2] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3fcf9f334d272989b57acc7b94d4eac717206118

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


