Return-Path: <linux-renesas-soc+bounces-30602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLAqHYyVymkj+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:23:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225935DBED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23423305B5C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FD333B96A;
	Mon, 30 Mar 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8vUAr6k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ol99mi3B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810133ADBC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 15:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883352; cv=none; b=SE0pR+YXxjHUGnaRzuTDl9XpQIom5Cl7DBNSFDXC0uY6eb0Pe8NorQfYyKtWShMN57yuPwl3d5FhCcaAEJJ8T6ClheHFWRR6TAw2rGDZRDys/Ee0y+Q3+RbcBOB8YQg7w+EweQkQEdCRf+LHzJ2UbdyDOVNNX5riITPGd8kF9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883352; c=relaxed/simple;
	bh=UETGGgVBuUFVU//IoPb6yqREGa8Fyc8FmIKlatx8jKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDnRWO3z0qwfcnpmuo+hdaZTUCvdOqNQgCRE330UG+9HVDas/WM999HQP+Wo2B+8xyHkr09WlhuqKrfjRa+eYU6gpbN28pz47hgTK2kAXdf1Gs6RU6dvrKXb9pE/Xr6lXWU2ZtdsL4CbpCay7pWVgKeOy4IB1h6Qjsb8Q4ijWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8vUAr6k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ol99mi3B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774883350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
	b=P8vUAr6kFaYk/Ch4fnNpG9bGn2sPJV3RtjeRefSlJK0RP718rfk11wWj3nrwFBtLykaVx7
	CEKfOn9BUa6mfrUnAlPjz7jt8BIZjAuDc15Hzx1aZyIuEjNuQv13tzrYZJrmH/b0CVGGgF
	PM26Vyynv7adL/ufZ8ZtDAKsnAyDU3s=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-Vhr25SkhPsOWwZLkvq2YfA-1; Mon, 30 Mar 2026 11:09:09 -0400
X-MC-Unique: Vhr25SkhPsOWwZLkvq2YfA-1
X-Mimecast-MFC-AGG-ID: Vhr25SkhPsOWwZLkvq2YfA_1774883348
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso167614421cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774883348; x=1775488148; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
        b=Ol99mi3ByiWoZqk2YGxdee5Ky9+lYtw255wjlUjibu9l6572lHPLF0dP59LFtQKngU
         w08awrwKoeRJKHsf8luQYoAa8mz4C41vFLwWyji/F36OU1k4qseYMmhBMlRKxI4nPKK9
         MCKNCCKKJr2xFL8JowkuaiWqlg5g9f7VqhKdKNQv7LrtLU7wTj9DVXn4sCdheIim4J8q
         l7ZzEXZIhB87/xNIjBqt3/VPs4jXBTTFXCkSokyke285ls3ckSKMFC2azLGcCU+p2DHs
         brT9yXQOYMWHeRYQFXOLtkGB8RqaD2uVW0MXF88d0Tu/ydSVPOxK+rUwudLi9uGQEois
         GHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883348; x=1775488148;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RZylSVCYgAIw5EH+90iXOfbLfETW2Xky5UhPlA+i2U=;
        b=QPIG+YdjdguUGJBzSymEmKLg02uPVcM66DAoSJnr2uqo4TWPp9k3S29UAt8hfPUg5R
         SfTSqaBm0z/M12CeUhNPclWkJ6px7M+MFJoXsxJurgAoki3+SxHHGuGkZL/pa1R695qq
         eCYx/4i9atL4YwGaCAmLj1JLMRr/MnU3ZOq6ehpYobZdECqetkFo7lPEfBss9BamaMiW
         pEbp8u1AEupwtkJMEQjZE+6if5HnXiEAVl4gAyedh36afUU5i3DDcWpJn72hMjs++FBf
         cUjeQW4uQpXKasMBW/23cSCYWuPqyVkD5521f3Tfi2wMmNKnSLBgdYgtpkhYWBtvbe7s
         LSTA==
X-Forwarded-Encrypted: i=1; AJvYcCUVnAgWEsZbxcl6xFY3r6DwpIAmSn6Z8z8PfiQyoe93mGUjWtuM0Xqz76UxeorPfJwtm2qyqhfEpu+J84UAS3o4KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyil+lRNGluZBgg4kDLs1hAzeSIFk8eLEfrtCvtPiOY8n9oYDr0
	xkVqM24OGGQQugtaGsfEiUMIZ80Iauxgu5Et42YwLId+MzPUO4sWLHArRw0ANeasKIb0F0w+dPC
	h1SjY6HefsL1DRH6H/vUIxpk7WT795l4KtadoI29P1Rrzw7QGwPwH5XK/oAYmZayv/qPB4K9V
X-Gm-Gg: ATEYQzyt4utP0UiTDOYpljZdNTBXwx/NwIUkq/6QbLpovd0/fjdZJnt12r1dH53Ru4n
	YpLWivxTxAbT8xZj1kVM6NOHI2yNoGnV6+GBbe2H9ByGuQpHetsssAxOEqLXLi9KVsB5bVWvasV
	PgQv6yiO/9xVx/ZMStixUNljbxKcfAiwBvAltSS7oqNk2JSa374RA9irz2ez7Q2Px0fhXVD5/tP
	5iA98WyF/NFQOiD9WNtWGkvPVYOn9KuBYT08yQadSQUv4BZTrFuCvGswSKY5nPlxzawbhMpugSv
	mTqnJFE0QZ9t8jFIu/DUVZfmgoG187PMJJlx0LdjJ7OmSTb7vHyxB4KxjBmRznpQW4h05/ubMqe
	xKPzVLCnD+Cb4kV0kLBFoJmrAIOr07jRp2eGcKY4HfpS9y95DjsU2bS6V
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr171149701cf.27.1774883348276;
        Mon, 30 Mar 2026 08:09:08 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:50b:3b54:d796 with SMTP id d75a77b69052e-50ba380f13dmr171148751cf.27.1774883347545;
        Mon, 30 Mar 2026 08:09:07 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e0fe31sm63567841cf.20.2026.03.30.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:09:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:09:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
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
Message-ID: <acqSD1k91pKGj0Rr@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30602-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 1225935DBED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:09:32PM +0100, Miquel Raynal (Schneider Electric) wrote:
> A nexus node is some kind of parent device abstracting the outer
> connections. They are particularly useful for describing connectors-like
> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
> 
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
> 
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
> 
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
> 
> * Nexus OF support:
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
> 
> Expected Nexus properties supported:
> - clock-map: maps inner clocks to inlet clocks,
> - clock-map-mask: specifier cell(s) which will be remapped,
> - clock-map-pass-thru: specifier cell(s) not used for remapping,
>   forwarded as-is.
> 
> In my own usage I had to deal with controllers where clock-map-mask and
> clock-map-pass-thru were not relevant, but here is a made up example
> showing how all these properties could go together:
> 
> Example:
>     soc_clk: clock-controller {
>         #clock-cells = <2>;
>     };
> 
>     container: container {
>         #clock-cells = <2>;
>         clock-map = <0 0 &soc_clk 2 0>,
>                     <1 0 &soc_clk 6 0>;
>         clock-map-mask = <0xffffffff 0x0>;
>         clock-map-pass-thru = <0x0 0xffffffff>;
> 
>         child-device {
>             clocks = <&container 1 0>;
> 	    /* This is equivalent to <&soc_clk 6 0> */
>         };
>     };
> 
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


