Return-Path: <linux-renesas-soc+bounces-30690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O5qH/EmzWnJaQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 16:08:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2237BD7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 16:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A910730582B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 14:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF262E6CCD;
	Wed,  1 Apr 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQctaaUu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OsP54f9/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330C2DB7A3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052275; cv=none; b=EL7URky5tnWbJmDQhf7W1+XJHXvUT0cuhmVZe6C60609R60TlB3owlXKa8bTcQeXwq5VyASA7Me607P/uHFTLJrqT3kVj8X/HYAg1r2r4pKpxCZ4OkieZHBlJE0pov8yO/8DoRb1kStdlie7Lx3pIvx+f6yPkSSsew6QJxP4R38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052275; c=relaxed/simple;
	bh=ENBbqPvMtgDBrtNY5Maiukm89IlJO8HyVFmraI/eHfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9sJ5IV9PoM4kdjX1fYNcOkVGvuaaCQ28k52HHxDRBfQm2rivX+5oX0+BPRqsGUa/M3zSto8hdq/ex+MS9dsc+pIC3QoS1yu1oMaVXCQmInZyyDsjpjZfL7s7Z8FrntPokJgXWbzrCjAfnlYIH/7y2yv0iYgF1ptkCnuqXMI0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQctaaUu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OsP54f9/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775052273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
	b=MQctaaUu6qEnE0fykNKj7lmbdilz+j+/wmnC+FpwPkzZFxuciX4IUR0MTdaCmL+6WxXauH
	T+txM0iRZjFqixbPWYNNVNQVNdub3ommwu1FdTTMdcXPCOm6jcgDYJKNZfWbb+eyf0Gs7n
	VBK+uGYC9RzmFgf5WS5qyF5ObDcx6WQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-ALsYFkIgOma3JDwV5szRzg-1; Wed, 01 Apr 2026 10:04:30 -0400
X-MC-Unique: ALsYFkIgOma3JDwV5szRzg-1
X-Mimecast-MFC-AGG-ID: ALsYFkIgOma3JDwV5szRzg_1775052270
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67e1cbc56abso18187099eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775052270; x=1775657070; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
        b=OsP54f9/cRkV5KVwx73LS4B/Kq7ktCySUtk9oZFpaM6W0upTXpY19rwVHfRsavgDEp
         GE4vL7VsNbVNjWJgDf70xKDWQTw/zWkPiX97MtiG+m+YJoGAwmzTqpfjtAA7H+hf/Nw7
         0m2Doue+m/Ih9mYhVFugzbeluApxsdcFLLim/E7FBhjdqiUMmUz4hESiZZNywAJ59fYq
         mnGcwXv3WtDYFdN5L+5rWUn7yC/v6j3XdWWM6xY3RsjxFwl7bDI8p8E2ogWE5jOokpNX
         4dNO+7YcSMFQYjQMlYGklsOXKkXPiwGx+Wphq12pjvI0aPqM/xWnfBJ6BgUVHfEnnlJL
         T7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052270; x=1775657070;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tcMceLtrrOoF9OBObZDKWhIp/2bPn54+SJ2oUftQ6n8=;
        b=rWxwpMIk1CyL48Yr56nKewqMpqut2HUi15kKueS5g6piN9hFrDojNPHAVDR4TlqEzb
         QPYL4oOQKIb84CIcZ2kFTuz3aGaWD5iLn6xpMjt/zyAzV8OIdT0WEr8Dr69UeXi38idH
         wTIQcryPM0ZEqirLGxXYjOPDchw/hAn0PVfCMDecfBlcm6Hg4Nq66yM+zs6n5UyTZ7qG
         AsTOiDMMy7NhR0Ue3Y3EzmIEhh/7fC3jCt09lGzb/yo3kkYYKcwz5vGZBnuSWCCbWVwS
         aFwPPgUYwAvb5GvCPJHN6pe27bnm7OGR3UT3x4hV7HMIuQ7qtoygCPvaB6jDkqBEojf2
         Klvw==
X-Forwarded-Encrypted: i=1; AJvYcCXvPSiJi5Nkv6X5qppAFa2Eg6dN4SiK8EUiXVKV12HtpAAMdd7wIP0hD0BZ2uXNVmoV3/fDplyVfmPetRuYfnWPvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOeX8xPEEDZ7P+wfFPy77qd1hWAtN4u2dtxDPYq+9wIiq+v3sx
	0DKjgYBpkOh9z9+l0pXErf0x7Nr+AaPR3kznaOF10bPlUDNZOs9mNbNOVoOgcLGsXcK5hTeXPeD
	qBwiUQ3fLGDfVDePjvqCMOd6hiydkEoVC1BTXDrc4x0ywyZYY8GTxVdIBDpfBtJsBmLY/6fV9
X-Gm-Gg: ATEYQzwivkQ0NfDSGMI7j1tuIKmmaTkS6nE9/V/MAIbJTA3bImKS3ldw4jV8I6+zomC
	SS5X4Iq0ZyQp9Vw8BBGvci1963Gkip/iLNVxu+YIkqdnCK3lKMuII4H9U4lGlRCoWHOAzwxNvqG
	62ES2Njn9paojk7ryzdCPqGZzWvHehKSPdy1Il3JfuqiebF4qotBqltVfyidz8XBbvQNwvySlqk
	mKvm5GQXakBCMddAH9o7h3aFrgrgZ/6TG7nJFjv4vECquIUeqQm6Kavnl6n1k7ETmlT5cDkC85e
	L2c+47AR80VXgDdQ4PTivwD70Hy7IrdDsITuXD/mbH/KJLh/XTftbsnPBhCJIPTzfPYHhGSB9RS
	M0ZbZc0Bj7lQJmP+3258iE6C6egDzbZTyTg5zoIemISytoM6pprHzs2du
X-Received: by 2002:a05:6820:4b81:b0:67d:e102:da05 with SMTP id 006d021491bc7-67fabd323a0mr1831330eaf.63.1775052269873;
        Wed, 01 Apr 2026 07:04:29 -0700 (PDT)
X-Received: by 2002:a05:6820:4b81:b0:67d:e102:da05 with SMTP id 006d021491bc7-67fabd323a0mr1831271eaf.63.1775052269221;
        Wed, 01 Apr 2026 07:04:29 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf960d2esm117933246d6.34.2026.04.01.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:04:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 10:04:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
Message-ID: <ac0l51ikCd_r22da@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
 <acqT3Dh03y3JiLLc@redhat.com>
 <87y0j76p8o.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0j76p8o.fsf@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30690-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 63C2237BD7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miquel,

On Wed, Apr 01, 2026 at 10:47:51AM +0200, Miquel Raynal wrote:
> First, thanks for the whole review.
> 
> On 30/03/2026 at 11:16:44 -04, Brian Masney <bmasney@redhat.com> wrote:
> >> -		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> >> -						 index, out_args);
> >> +		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
> >> +						     index, out_args);
> >
> > Before I left my Reviewed-by, I should have double checked Sashiko. It
> > has several questions about this patch. The first is:
> >
> >     Are there other places in the clock framework that need to transition to the
> >     new map API to ensure assigned clocks work?
> >     
> >     For instance, assigned-clocks and assigned-clock-parents are parsed in
> >     drivers/clk/clk-conf.c using of_parse_phandle_with_args(). If a device
> >     specifies an assigned clock that routes through a nexus node, will it fail
> >     to configure because the map is not traversed?
> 
> The goal of the nexus node is to isolate what is behind. Are
> assigned-clocks et al. supposed to traverse a nexus node? I am tempted
> to say "no", but I'm open to discussing this ofc.

I agree that it's not needed as well, however I want to defer to
Stephen's expertise here. I mainly brought this up trying to help him
with reviews.

> > https://sashiko.dev/#/patchset/20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994%40bootlin.com?patch=12563
> 
> I have mixed feelings concerning Sashiko's feedback. I will go through
> that page nevertheless, there are interesting comments in there.

I have mixed feelings as well about the feedback from Sashiko. It finds
issues, however not all of the feedback has been helpful. On the whole,
I'm glad that it's available.

Brian


