Return-Path: <linux-renesas-soc+bounces-30600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEiZHpqQyml++AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:02:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877535D63E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5CC33008CAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72FE336890;
	Mon, 30 Mar 2026 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gryK/604";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jrE7BW84"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D00334374
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882929; cv=none; b=Uj7yEaDH3G81illPhQB3exGQcdYvMaxGciQ5Lx643ZPFBYXC4PJtpaJrLgXaRwclu+crsaWhM51VIaGAQl5EQfAxbqQofvaX52tU9I9a6c7HcY/S8WWzRlh21+Gw8h8AHEm+HnX4yVSYWe/GLQVAtAwq/gel13BksW7+6XSQRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882929; c=relaxed/simple;
	bh=fVkuWa4a6/cQxsnJg9pRm7tn6P2ndJyKnXupZf2dZoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFYTj3B8fHzj35UKr9T9X5Ya8o7lrNF+bsA+Y0QNFiRPrQCVh2RVHUAdqirfwM4z2J9AGFhVtpo9OnWbhZQEHXA2TLW0pz8jqBGSOVDpI2vlHPYmIjg3X+WuZkIBhT2fiuFjjXP20eo5m7YvT+gTcbDeL9+k5YpqWfDi+PZXCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gryK/604; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jrE7BW84; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
	b=gryK/604N2YQmn1tuyW/Xeoedk8CRQT4AvBs4BpnUszq1LzbwGwD8Zlnb46u2rmd7pWqIB
	kdzLhIYQQ9IO+Sxh90ofRrubYTFSnI1lMVSRYR/Yhz2oZMP1Qi/K9ZdQWb+EvuxRKNoKKN
	B3jjFGXurzya2NsZsmOqa4AL67H7vV8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-dAPpRhyeNfWvhEPEH5X_7g-1; Mon, 30 Mar 2026 11:02:05 -0400
X-MC-Unique: dAPpRhyeNfWvhEPEH5X_7g-1
X-Mimecast-MFC-AGG-ID: dAPpRhyeNfWvhEPEH5X_7g_1774882925
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd8b56114so13749886d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882925; x=1775487725; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=jrE7BW84LjtH3vjTmBnHSlGa9i45Xcm+Eq6/D8A1g80H6L6bcPPvJe8apOSND4rGly
         CVVgCWYGv1Lo/tBCw5MWiv3ERaKvKiiTTuBnu+sY+Oi62WrotCIphf/6k2e1sAB6feu0
         nuccqoKu/TzSO8QoP+w9kDFJk7JfKn7ouvhphlLNKY4ja2o+HQOB7IdRJq9PV5sjuoaW
         i4vog5D0MGMW1bppab45CNPmHcnb8htqzb4mI6aA0L/kIOLiZQG2EQ2sQFcOsusEvsoL
         lKCBMZzARmnt6niXa0Q9nBmYH6jen297Aldk53QXMiBEwamv/3kAQoTkqvTKLxmJPVMt
         LITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882925; x=1775487725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=jUUa+eZuPEu/nqOCrNxY2dCM7/K+KEaIEQ1OtZ/ZXSlpbRDOtz88O493kordDEIPIF
         qfManrEtluweLi77ZE7iuOFwqnAh3zFkx78MK7GOnqIotoJYeJJuvy3vE2AFPVx3mABf
         mwVQQtmCfL6ogVhLzhjTIkV61gCS6Hnqe4nGqfTiAVkGjz84ydtj5OJsOsCgkveniyEe
         DpuzC64LBygGVHVMTa36R5CBJpTqgEuAiJ99TU7N5rY6nGLexVl06pr4GPDuhIwthf9/
         gZDX1ZhNe5tt/qFdBtogEroS60pWloV9gOs9T17SM4/6Wl9mHV169c4gmS3flcjPwP4/
         6ojw==
X-Forwarded-Encrypted: i=1; AJvYcCVGVVaRr1nzb3m5phZHFnouuHtQnQT7Aw6Mu6b/FJBYB5WkSNFmVD6PFeJplX++RO0/9PuKjY2tIrjbGcSE22+mbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywev4sQ68S9D5K23ULZVN05oHDevG8j3mf3fh+2k8dlpjENSIH0
	35BlvaAXzDcgyZQdJO6SwcDXaHTwvXU92cgH0jcgPtzxJ5HqtPym83zPrA3doABXP3T8RKx1Szl
	VuWwkU8ZxmfMX0ZJ77Gr3IDK4waiWvFeL+YJwuEXw/xlhM5S9k0ejb/IBuAKBEpquj6HHB+aQ
X-Gm-Gg: ATEYQzwefxoTOcmT55p0ESaEIjLiwPiU7oYENGlXR9EsIPFLxOdSD2+6jMK53Bgj1q9
	8EFPsIKSesCacEVF/TL3DbMEIxGi+v5sy5j+Ydz95CmUKGH2WFB0YccnFzXQiIc/NutDjVPFaxu
	LVvCT2Mumj3Ho1GXPnYuK3vxVnAbC4JSWU5aryznhylHLhYtSE9dA1wSvkBcpo5F9DvVsnL0Mir
	wEXR5Xi4BtIiWhNdZQVAZ6DJoT36kZYKBLnWYjo/yAx18jEa8ERyBb6rSESoIvVKAi2oDgHycgO
	gWD65X2hCuNkcLR0VXBO8DnZ7y7daDAOqzYqvLXMpK9Y3xfebUujCVLAeGu7KIGoT6pBQqPB/DP
	nu3Q6ooFyeC6OC5vbHewvFmK45qu2sh3cPw46rUCFJgPCmjJAZpTHAPDg
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89272056d6.33.1774882923320;
        Mon, 30 Mar 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89271186d6.33.1774882922650;
        Mon, 30 Mar 2026 08:02:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f49cbb8besm57387836d6.43.2026.03.30.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:02:01 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:01:59 -0400
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
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/16] clk: Use the generic OF phandle parsing in only
 one place
Message-ID: <acqQZ5sx_WZrr4KJ@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30600-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2877535D63E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:09:31PM +0100, Miquel Raynal (Schneider Electric) wrote:
> There should be one single entry in the OF world, so that the way we
> parse the DT is always the same. make sure this is the case by avoid
> calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
> is even more relevant as we currently fail to parse clock-ranges. As a
> result, it seems to be safer to directly call of_parse_clkspec() there.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 591c0780b61e..93e33ff30f3a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5375,8 +5375,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
>  	int count;
>  	struct clk *clk;
>  
> -	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> -					&clkspec);
> +	rc = of_parse_clkspec(np, index, NULL, &clkspec);
>  	if (rc)
>  		return NULL;

Reviewed-by: Brian Masney <bmasney@redhat.com>

In case a Fixes tag is warranted, it's not exactly clear what should be
used. This was introduced in commit 766e6a4ec602 ("clk: add DT clock
binding support") in 2012. However of_parse_clkspec was introduced in
commit 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()") in
2018.


