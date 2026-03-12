Return-Path: <linux-renesas-soc+bounces-29282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOeIMjrDsmmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:44:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30160272D11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ACBA3138E08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E803BED5D;
	Thu, 12 Mar 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC+y+b3U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC630B51D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322872; cv=none; b=RHDPG/41AnO1v4y8aD82+jOBHBrhKgclO+HlMb3jIYgU7mTfGTZ+H/7LLNpterHffi5UWkBOSc1vtW/TFiJIjKatZ6jxuKPUvril0Dxdjbo8VNQOlTn2jXBTBmbEDMuMBi6zkbUqAipwSROgBHOTm8Ze0T/d5msfpVC5NQy3Zwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322872; c=relaxed/simple;
	bh=waraj5aVzmh8TaApwAwE+I7GTdNW5H0awz3aoMmNyyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNKK6NPMUCNmuI/nvq/ny03xfZdjf2dFzEsIuFJWMA0rNVx3zWktetlGeW8fGpMX0J+AGJjEbgF7rW9n/Cl1ctbWuaBwxdOnkCfuYTpk76/cdjILTcJPFwGFgoxDMfHyfdSdJK0FTTjZaYkMhBs6Lo5jwmLaziZYFJDdGH+DWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC+y+b3U; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-660be63279bso3118343a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773322869; x=1773927669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAwHxaCXl501xCvwTjF8MsYHH2W+UlwYAi/493OFfIU=;
        b=FC+y+b3UtlYe9p7/e8Br0wM5PCjo1zky6OiEZd3JefPnp6yIKL/UNYxWQMAafJSqkb
         bvTK2QKxLx05oDfsfWu8j7OIqbN6aQc3sHHXiXfIIleWaLP5Z7dql1Pca3Z3thNBu25c
         Ffk9rWEu97SruD0ImfeQDxOrHD3ghZGG5vWdHLno5WZj4EK19KU+s6zrVTyzFdJGCrDs
         XlW1IzG7KDwWaosCwXmQa0jv0zqPGH0kYFu2ydQQI4FxDKdJWLPn4TIKPHZasesG8qbu
         sefFwMrK9gYYJZjMnmPZqINqDFsznCd1jsd0pp0t2+5ZEssDrvK97I/tnuUJ2oGBR6Z0
         r0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322869; x=1773927669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAwHxaCXl501xCvwTjF8MsYHH2W+UlwYAi/493OFfIU=;
        b=mCKIhy18EelB3/3bnCRyy6JgFjpVoo8E/bH3exeGI0AYLzovZGKnE2vnE843FrQ1Co
         RPUYY5WtfmPSAikN4VVbAip9BAbTWGxQZsYfHX5wkYS8viwyxJb7LDQu3yPzo2rHtQWo
         5AI4zO+amWsfIrWTnrhxtEgq4NQbiTeMGf89ljBNxtAD79IVRJ9BTP2ggjc8HI+Cj0BR
         9bt7bCZflgXvTQaYXZLzCeA+hkJvhbAs6uc8EKqrSNIMux8Nw153IzUXfPZzToulnmR4
         0RM1VzSN3natQPbxe15g8XO/YjaI5cxTZwaCdYC8JgY2eRX3MOh30ilo7pP6SiO/h1vC
         MYMA==
X-Forwarded-Encrypted: i=1; AJvYcCVRNNsXfqxFcAwHumCYADCo2I9FbkoiTM0R90SA8ysaqp48Gxq4xwR5JLSEGb1vp8nyqQIkO1/qnrriwz7x/jxRfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFsDUW09DTfO8hRLHwXJ/Puymnxfwmr8KNEQGzYTQhxSx6V6o
	HlxJXqbvVi+h4zpQKcbv+2WQucGQK7phDrO/MOgoQVSV3W1iepV5fwFu
X-Gm-Gg: ATEYQzxfVkZpa2+ZXtJbyvEVh24MLA/zQjNGxA+P4C3z6rQVdCymm3MyqiA+NdtgxGj
	mtuDktHcSUVrzWlZWn22GVKAthv18kjROv8VHqlyeTWhV9XVxudNOXqf9b5mP5153+pObXb0Jt9
	sPaKDz1l0LzoRobBFUs0YRQDMcGTgjsLGNRedQBQgJ7Qz4m2KJnSB1S+UUFlt+uZZY3Qltyy0hj
	4BrHf9DeSuH0kE6HN5ZkSjtCqAfbI9i4mAHT0/YaqHBGaDApInIqFCtSKpoYtKMeEfCs2us1C0M
	x+jvqL7O1JNJ36aYlIZY3aKO/aiG1vGsky6MByk/+jcBN9s6YpNE7jLe3n9zajunOH0h2L0fJBE
	aXo5+QgwklB/GreDJO66M2iZONtNtAoj4fIiOl/BKo4mFZxvK57j9eoIAlbDz7KIBjvgrFvD913
	TukqEBck30jEQoNHd55JEy970=
X-Received: by 2002:a17:906:fe49:b0:b96:f02b:3d5a with SMTP id a640c23a62f3a-b973ffcee42mr208925966b.16.1773322869240;
        Thu, 12 Mar 2026 06:41:09 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14dc3asm135857166b.39.2026.03.12.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:41:08 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:41:07 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: micrel: Sort lists
Message-ID: <abLCc6Kb6xIQiMZr@eichest-laptop>
References: <cover.1773321267.git.geert+renesas@glider.be>
 <013afe74bef9a4d4af8b5a204cb4891518f7274d.1773321267.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013afe74bef9a4d4af8b5a204cb4891518f7274d.1773321267.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29282-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eichest@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 30160272D11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:27:35PM +0100, Geert Uytterhoeven wrote:
> Sort lists of PHY models and compatible values alphabetically.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/micrel.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
> index ecc00169ef805dc2..5d25f0d0a508a6df 100644
> --- a/Documentation/devicetree/bindings/net/micrel.yaml
> +++ b/Documentation/devicetree/bindings/net/micrel.yaml
> @@ -51,9 +51,9 @@ properties:
>        bits that are currently supported:
>  
>        KSZ8001: register 0x1e, bits 15..14
> -      KSZ8041: register 0x1e, bits 15..14
>        KSZ8021: register 0x1f, bits 5..4
>        KSZ8031: register 0x1f, bits 5..4
> +      KSZ8041: register 0x1e, bits 15..14
>        KSZ8051: register 0x1f, bits 5..4
>        KSZ8081: register 0x1f, bits 5..4
>        KSZ8091: register 0x1f, bits 5..4
> @@ -80,9 +80,9 @@ allOf:
>              contains:
>                enum:
>                  - ethernet-phy-id0022.1510
> +                - ethernet-phy-id0022.1550
>                  - ethernet-phy-id0022.1555
>                  - ethernet-phy-id0022.1556
> -                - ethernet-phy-id0022.1550
>                  - ethernet-phy-id0022.1560
>                  - ethernet-phy-id0022.161a
>      then:

Looks good to me, thanks for the cleanup.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>

