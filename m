Return-Path: <linux-renesas-soc+bounces-31260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM9QKnkb3mmFnAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 12:48:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E263F8F10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 12:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8188B30B8DDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E143D8100;
	Tue, 14 Apr 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcAtfRjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C633D6471
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163276; cv=pass; b=P8EfQxi+3hBL+h2GNxCD780sxGAFIoMb779c4EMic3FfjJaWyaFT/zgseJIuFJeM6BHkqg0wFCOvnNNLcY5EGg62m9CoAsOiT9VKTBCs01IfpbDoVpoeFc+0Kh3hZ7uZdUaFoPcqBTRRPfmPTGVyZzgjiJW6C8piI9diizcFQDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163276; c=relaxed/simple;
	bh=FRJ1V4Rg7H7FZyF7SYOEYn6+kpQ3Ohx/3Kg30U4brH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKA4Aa7nwxiCRtU+ajuyHhm+ER6VuA8LALcTkyn8D3s2qkKPQg/yC0L+0jEW6gbByHVbZVb+xkaOwFXO1c5Ajxy5QU9hyqVzp26IsxZOSg4njKZC1MPq/L3BIQaNKdPN/+9z7sUjmU7dxVV7dp+g2CtLDg45EcGQJQXbcf1mI6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcAtfRjM; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so3445950a91.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 03:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776163269; cv=none;
        d=google.com; s=arc-20240605;
        b=Jojq4mL9W3meJVrjks4LVpeZ2OTOoTkQM9zsd8VtIrrGCdGBbnC8ea8RxEZGzGZWmq
         jqrgoxW7/xjyRRyTPPYt5Za83oLJ7KendPHA5HmEBo7T8qxA9zkGV+HWvv6odmeC0BiL
         rC/dhP4JmYXDo9Xn1A7vNtz+88IpbrnaMpP7LFnga4NqdR7Jr2uwRS/Tzjb81Kg9w1yg
         OeiLZgRKlV3fl1hzKD6pWN/i1dDnQe4glQIZDAzPRoCWPV8ujHcVK2FsOziO0oxsE65o
         L4ukd9WNJrmk5NurSN114AqBdHCEwSqX+ZELeLGNbasn1TioqlKx0bPnsuio3F/+B9o7
         m6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        fh=c1uyG+Nimb6LQcVEL0TglGacvJJ/XCTW+kWMMAOsJN8=;
        b=F9AoWvZRvWj9GvxgDZSplxNELMqeBzPyBxe/swd1LNpEsH0/RIFn+lJjnt2KoHagh0
         jRQOsXcD+m9dCHmH4c/I7XkSZfPkjZIebqxzfkOL3IN4+GdL6QYMegf2uENbxA+9sWEE
         Hg6RLXvQY9YcElXsx9qwfzOAct+tHzRRUnmXkkossKF4ywT9FzMcpdIRF5AusXPF817G
         W47+u1v8LVLL7wLt4fVz/AgJqUK/DJz456k0Vz74baltKt5IZaL6IBQwDU6vNu6Wqo5E
         3rYxMtM/5F8aW9p+OABLC0pwcaZfI626iMoy60TLqKN/PVsHD32Bo+DHFsgRDklo+aF0
         T3rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776163269; x=1776768069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=hcAtfRjM2dJeBFRpJuxJpdNi+e623wV1TUB/wleAZufLFl7Z8aNx3UW2Y4Ax8rDVzc
         n4gUUJK2OV632+nekcK/1piRet9gbGYkg55ll2+g3LTd/ZrsQj2SiODm9TtSnF0yE/n1
         Qi7USEY7dcC/2rLFNCe7M4PLBpyya1DFiVN1T1X2XDyqrlTOzMbPnJJWoPCQNvDFp29P
         e9Of8oR7pPN9qORbiyhAoyGwg8+SrwE+Y4nCxqqLbtIeDThfy4V7eTe4IVbsHNQBh43t
         lSsrobZPR2L3go8lb6FIB0+n2QNqOxGQX8sMOM64Sc93Qsokbvq6jV1QxBWwYM3T5xUq
         TYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163269; x=1776768069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDpaKgtvK1gesz/aQw1mjbgT5u/KzUnIhgbKYhPDE5I=;
        b=MzqDoPnOha2KL1Pgh6gV50G/ghUu3vr7681TXxjM8ga3KGSISnYO1rDnZGCRpw9m5g
         ter0uDDcKglXbOjrn+rDvocHnFLDW+VVIsyfRqhHNq/LTsE+0T6yiDmD40XeJAoQ5PSy
         w4RK48U54/Q4iPuEUhsKi4j4Z8jTPvpFj1PoBVYY8OdFraL94LQYQCxbdgOEZdSuf/AG
         sUoHIUHxeyhuLZJWVBubmA0O0NiAc+dPX8LqcxV0FxsYbcPLz7u9WXSRR0Ak0uf6um9T
         nwig2ROmsBcdYmfMd1AJkojgoyn8a1AiSqPcgCA8xbTKKbepcGzNY7W+Dc0rMbkrcRa+
         rV+g==
X-Forwarded-Encrypted: i=1; AFNElJ9V+w2dheX6vrK5TuL3VGahJrHIT/y+HVRVs98HaoVcFsbpIkd0uJc8bFErTgdRTReF5Ts4aTjuE59FCrG+3C7Y6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydDv4kyTYHrHUy2G7iKfc10/CtB4QnXrpB0PQO2nNDtBLWR0SP
	gCVvpLNZGkBeyGbgV9Abg3Wd6QhJmgbG3h0KmvoSa7HrmRhjSoTDtpHMnF3+B6Ng077lx7/ftZb
	A0zPRuG1XYcd9STRyHvGlG40X4wh7LE0=
X-Gm-Gg: AeBDieuixPdOVrWeu2VLhYGyuDJ731Ih5vFln2wC3MA4syDh2m9SOM5WimC2gDe+aMg
	yyqmpbJRCtILMKmdF8lAjH89WbOLkkOeSsK5HOrgJszHwh2Oq9ZQf+AFqRWRRQmJbh9SpMhSa73
	P4NTge3Lp5uT7AV7fPbDfDY3Hrb4BD1dW5Tvc1SElwgbn6rFWQye1znnNwyMg+jGOIw4lAY/hOc
	3GlsOI06IyJtBNx2Jotcz1XkKT1eegTWNcvdfSzU2jyWCcYfn3GwuJFtJbSzPYFOKC3ulGmh7dj
	Gi0pRIHW+zBpaRvY70YEh5Ntt+yUpKtFZ/fksg==
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id
 98e67ed59e1d1-35e4281374emr16834509a91.23.1776163269477; Tue, 14 Apr 2026
 03:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll>
In-Reply-To: <20260414-funky-sincere-polecat-20b0bf@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 17:40:57 +0700
X-Gm-Features: AQROBzDyXFYNs7TrKIvlK_AGlBy9o7qpqavO_nNuacnjcjUFmQX1mxW8gHCuSbM
Message-ID: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31260-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 25E263F8F10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Thank you for your detailed review and feedback.

> Flexible is not allowed. Provide reasons for exception.

I understand and will remove this approach and replace it with
explicit valid clock combinations.

> This goes to the "clocks:"

Understood, I will move the description to "clocks".

> > +    minItems: 1
> > +    items:
> > +      - const: own
> > +      - &fsi_all_clks
>
> I don't understand this syntax.

Understood, I will drop the YAML anchor and use explicit constraints instead.

I will update it to the following structure:

  clocks:
    description: |
      Clock driving the FSI Controller :
      - "own": Main FSI module clock (must be first and always present)
      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
        enabled to allow register access as the FSI block is connected
        behind the SPU bus.
      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
      - "diva"/"divb": Internal FSI dividers for port A/B used for
        audio clock generation
      - "xcka"/"xckb": External clock inputs for FSI port A/B
        provided by the board
    minItems: 1
    maxItems: 8

  clock-names:

    minItems: 1
    maxItems: 8

allOf:
  - $ref: dai-common.yaml#
  - if:
      properties:
        compatible:
          contains:
            const: renesas,fsi2-r8a7740
    then:
      properties:
        clock-names:
          oneOf:
            - items:
                - const: own
                - const: spu
            - items:
                - const: own
                - const: spu
                - const: ickb
                - const: divb

Best regards,
Phuc

