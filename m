Return-Path: <linux-renesas-soc+bounces-29420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDxeD0kzt2lHNwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC80292DB1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24C2B300BC98
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 22:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA17BFC0A;
	Sun, 15 Mar 2026 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PURi+AQn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CDC27732
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613890; cv=none; b=s5k6VJM4yyUyBGxD+kxI9zDVGl9oq1C8ZxueVfofETDLfe59QMXuiBfuwbBRI4XDmBRdmAKdvuEnjdnwfSuIXQ7Z0ObIGUG6DEYiH5uGEyJ7c51yU2726PEAY1Z3GgIuUtb1VO9ZLA6We1mqzx/1R3lYZQIHOQFWhw5k42VaySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613890; c=relaxed/simple;
	bh=k94YN5JKvTtA2yqAykUnDIYGpUKDDKRAURTtbWd84Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb/THcVFvIjcELQIH4UWKOcjRbhcDrW5QWIgBuDpUoVZ/zujYGC2sQ4lt6lK63e57FfHuW5uz1dzuTo54vOGDC4uSpl4GR/MhdyWfaQ0gcrRBltdG7onRLY2q0K9zRYdz+YIddm5aBdDcRKy6S9r6BF3vauteZIOn/Aj/ymkoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PURi+AQn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso2779008f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 15:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773613888; x=1774218688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psC1iFlNWy3dhNQC4okUXqHI/RlsuV0BSpEgvkj3Ppw=;
        b=PURi+AQnfwkprLj18iOt+7jdtCpXIFZEOhSBY0od2yGZZCrWTds4Z7UFMlCklU40JI
         GQDW3lYoP8QrB6SqAsAdUD71ru/JFEn6lhLARhziiFBjcxj3pAmKuSmFoyqWrHAm29+A
         sz82AxPjD9zPaCZK7gQl78TNnJMCQd3MP+l/7ETyjXTyIb3OuTzxn1qsiAKM5/TqsbeK
         7punPCQ3RZWwK9pafWyuNqJjdIRa23WoKgr2ZOB15IRpE9dg91OCCOaE1JKHGmhSkcWK
         GC2iAOPsKvJvSlQnn9OPpVw7gEK+Q4Xv6l7HSqiruOV1J+g/lwYnMmW71CZaVg2QBHNK
         mpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613888; x=1774218688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psC1iFlNWy3dhNQC4okUXqHI/RlsuV0BSpEgvkj3Ppw=;
        b=EiNjLJhaTrUIVOLSbm57cwvVjQTlJaKUjf4vWVz5JpZex/YcSRQcV4Wty2kObrtuCY
         zITRXvqPwuSIAJIhJDtlTxHpTea7jarB2CSHgDpiBOCVpDbIDT8QsN634M1D3qUXmy83
         MCWSXWRO8Y7E0KIIYJ8tXpQeGbxf1/evlfvvFw7EotQq2ajJ1pwVZ9AjtFXxX7srt9fN
         7nbAoLR717qzk+uhVZPH8H+x60mqejBX2nBgibKsrXz/Sm3qs03D2A6hjyJWjblQuINc
         A9A1oFjhJIcokR5ghayqogde4ul5O6kxAYre12vaooBWsJzETbvCpLbZeLOu+AG6VyCV
         HBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUF7UzxSFYMSquqxWHNno82Z/9I31TZv/GQajdd8IDrpwbaPVX9hN50hb2LLZCg1Q9gQG4g9DDHAmFWcLkpTIpXiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4T15+dYTrYmrzzCt2hjnhp/eGY2UR3NZSg0WfxKd3dFj9BFHN
	X797J9UQEHKWjlFV5r4Ca6U2lhH9wygqbnaYgrj3J2/kmI/ghiRxlDzPdo6YTr5i1Go=
X-Gm-Gg: ATEYQzwByZJoJKTnVG9H/4eAvZqojVVIlQ4bmLdV4DfZNDeY7fsJe17OAXUEcLEj63p
	Jjbv4lhLxmHK1cSZu4nkgnW3PClGhSSmKscRUv0qOfMASwNGqpeQkFZrkZd2sjyXslMV0VBuMhg
	WAffdsBIMp8A3se+cES91N84Zkiren+xMdtjAaA7UwQRP8SCfnwn15t37zut3MwYOlzAHh/Ozmn
	ih/nKLUAAwG1pGiM+GIeGz99zU82fXwjRQJ+0HbKTbUUq9a4o8DvxXwBM65t4WOUkJCZ2I6VXfS
	FPoHqr9BwDyh68Cdsq/gERNWeVEDQijGCGB9r1yqe0YjGUpGlJ3Kx7PEdctxoorLUMJMpFegr5l
	a/Ldoo/93m7TvF9dmCkjT+o6r5lRV0aAlINZOLYm0oxWa/uqnRtdTN/GMJ+JRgG550GjrsQrMVd
	3pT2TgqASSNsn99GLekhG4KDGZ9g+Qzr4=
X-Received: by 2002:a5d:5c89:0:b0:43b:45d1:f448 with SMTP id ffacd0b85a97d-43b45d1f728mr440430f8f.14.1773613887983;
        Sun, 15 Mar 2026 15:31:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a72cdsm39232039f8f.9.2026.03.15.15.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 15:31:27 -0700 (PDT)
Message-ID: <c5063668-0c32-4bd4-9c7b-c8584f96f581@tuxon.dev>
Date: Mon, 16 Mar 2026 00:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260309165946.3003731-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260309165946.3003731-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-29420-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: ABC80292DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/9/26 18:59, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Annotate rzv2n_sys_init_data with __initconst as it is only used during
> initialization.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

