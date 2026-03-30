Return-Path: <linux-renesas-soc+bounces-30603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML5sJ6CWymla+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:28:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD435DD3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37072314D349
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6135A33F8A1;
	Mon, 30 Mar 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SsDuXIgT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pnucoW9B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D033F58C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 15:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883812; cv=none; b=SwxMeU+O1Ms8P2HGi7OiULhYMGGKMYbp3FtH/7AVPzF4l3nDmVh1vc6nk6VXmgxWW+k44SwsAHHI/ieN0PGpvKF5raKQ++K8x7FrXCVq647I0ECnk5P0JfYoJfGmBsXy7BeUNK+q1PY7WdXJTOLBOO2t2UPgSUlfp61Tnfyexko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883812; c=relaxed/simple;
	bh=NaVH8zIkqEU9AmQE+qLztKesEUMzinfCvffvpnQjuyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4XZjOglAHEMn0pPwR2gE7lqgUtr9SSri4gPmh4J0wKR1fpF/RQrVIxtoE2E18t3c6k8EYFLDmN88pUlWino2THWL/6jq9vovYpo6pPcrezWvmkj3A/vSYtIim3C118084R0ADTOUYLHpaNUkeIPABXAmIOYfVECwi04DR3g/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SsDuXIgT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pnucoW9B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774883810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beybqvcHZSF5ZRRU/l09CbOmW2h45yqjTC07lws0qAA=;
	b=SsDuXIgTWpiKsGQDv9e2voVTg0GXsoGxPPpYTYYXH/tVKTGfAUGdLDXFpbIs4lIssxhbSf
	Pvv4Ms/R+ylTCZ9rWxdP4egIyFfeNjso9xlk37p2PktzlLAK1G/Sw9W7LOjEu8WVxN7awE
	v0AnIWdKliJqgbsLNwt9wIbPyN7KOAk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-_i8KwZq7P9q5mKikvXltng-1; Mon, 30 Mar 2026 11:16:48 -0400
X-MC-Unique: _i8KwZq7P9q5mKikvXltng-1
X-Mimecast-MFC-AGG-ID: _i8KwZq7P9q5mKikvXltng_1774883808
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so782892185a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774883808; x=1775488608; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beybqvcHZSF5ZRRU/l09CbOmW2h45yqjTC07lws0qAA=;
        b=pnucoW9BDxiiYnarMq7wcIbhr40vyrhzuWZgDJJqSDvattYjknVyHet34Ae9Mv1tQ+
         kt6ZKLtGGENenyXoG4nvp7OfFaBv6OMlVGNcDbbkQXHo4L3LbghH8TCoyBhuHTFeHQlg
         ehjImeap2Z2jclbM1K5PCh0Ds/57M4hP358VHsi6laAF6TqEpSIP/0ApBlAJ8T4MZmXn
         O87NHKzFbjGolQ7y5FcFYQ/b9ftn/Mjr/ikrvusV2MV3FYt3Cnm7TabFqhUO+esII+a2
         ukkhPrvfln8e3a6gHaNUl1sprq0ZyFGiaAi5a0Dj6saxohz66cPfib3cQ8xkcnq0mo1m
         ytvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883808; x=1775488608;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beybqvcHZSF5ZRRU/l09CbOmW2h45yqjTC07lws0qAA=;
        b=FTdDb6zS7w93F9kiTclskkM4w7SZISbFFLDaxnbsnXQppRrbutrrgryqVaxrV4Ez0w
         p8lYHKYAmEKcymVD6u0sAmc2bpIfh4fbuKGif04p5Xf3ZHv1ERxp8Q/6dqOtdh3VnKGa
         XVsyx63UULvsbL6qRT091+8wYOyUIaDt9/QPlCvhCq858hm8iNRHtmjPhgR7cbEoc2nr
         mMmePIlrUYCbLqWDf13OPbnx9t4CjZmCKE5TBu613+qPhBE5oCY8O94UKGjbqgbBWRx5
         jDxE9N55abVUrr98JuuJidZRROYRWxJWKmnEj6aGWmWkiIbLrx+KDHGgpE4xvjo5V3xF
         vPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRshXzkXAi9pDWpJsSWcjRpTbMt3HSM3nKj6hBxsH2YsDenY5yT80qIB3GoycK2MyG1rEiQrbLnP1KzWQlM3fPQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrmCD+YUdOrf3N1l+TcbiTr1MZ16A6VXZSRIwyswe+aCpqwsi
	a0uoPMqPhBzfKz7aGWAnXNmxpBhNFXeFBPBIy3cZ/moH1rQH6UcihdUldyFlXKEXrQHHFI8WeKd
	bo9r6vX1u1cFBrV/peE1CP6qTIwuB8jfaPlFpGisDWmCbhRocYxTNU93knbpuBzjR/5DOUqAi
X-Gm-Gg: ATEYQzyf/RS6lMZQgM2vyZM7hNcdIYjYA8W4/f2mm5gP5wHOvPSS26AW/F9slr79vVm
	N8JZDKVXo4BH44Mv9ipNlaL/nOZD+jqD+idzLl1mLFEztFMYnbSWyrWCp5wM9NyWCv8cwSLo45c
	/DcBQMKm/N+HRSTRH+l5evrpLLrUX9Vok2hDXA6Q0C5SewvHMT1k5D3Rr8ApnD6r+n9SDAq64uo
	tyyFn2376y7osvR9/oo0FaOZ+NBPiZsq7UQv7arovs3qDukgpwlxqbNwpPUHqrlDADNLZtHPWNc
	n59CAPMTGd+O3ZsS47MwMtIZnqwtBcP9hvJL3P7p2Rolwjj2uzBg1iOhNJp3p9qTFnbHRzaPqMP
	Ed3TODekmg4N2fUy1HR/zrjTe3DgJz55wgQfq/cqJIx1ZCWqDz7pm1R/7
X-Received: by 2002:a05:620a:448a:b0:8cd:c04f:c6a1 with SMTP id af79cd13be357-8d01c816db2mr1669490885a.58.1774883807925;
        Mon, 30 Mar 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:448a:b0:8cd:c04f:c6a1 with SMTP id af79cd13be357-8d01c816db2mr1669485885a.58.1774883807244;
        Mon, 30 Mar 2026 08:16:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806a37bsm617484985a.34.2026.03.30.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:46 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:16:44 -0400
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
Message-ID: <acqT3Dh03y3JiLLc@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30603-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,sashiko.dev:url]
X-Rspamd-Queue-Id: 01CD435DD3F
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
> ---
>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 93e33ff30f3a..196ba727e84b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5218,8 +5218,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
>  		 */
>  		if (name)
>  			index = of_property_match_string(np, "clock-names", name);
> -		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> -						 index, out_args);
> +		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
> +						     index, out_args);

Before I left my Reviewed-by, I should have double checked Sashiko. It
has several questions about this patch. The first is:

    Are there other places in the clock framework that need to transition to the
    new map API to ensure assigned clocks work?
    
    For instance, assigned-clocks and assigned-clock-parents are parsed in
    drivers/clk/clk-conf.c using of_parse_phandle_with_args(). If a device
    specifies an assigned clock that routes through a nexus node, will it fail
    to configure because the map is not traversed?

https://sashiko.dev/#/patchset/20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994%40bootlin.com?patch=12563

Brian


