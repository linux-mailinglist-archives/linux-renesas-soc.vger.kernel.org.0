Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75D07664233
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 14:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbjAJNrw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 08:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234040AbjAJNru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 08:47:50 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6102C3D9EC;
        Tue, 10 Jan 2023 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673358469; x=1704894469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IANc8BcR8bv1o/X9X8afiNRzt7YZdqQIj355WEJOuWg=;
  b=pWk4UVaInQ84dbdgL3bLEs0PWJ3Yaj+O/GKBvTvvFbUwK9upts/OVebO
   J/lZIXwIgQvAma3s6M0KObnRfvwzAAzQFRRTSmfqRoPfh8h1azOeUPK8J
   nZn9nTo1hHXdTgOlrH6mrKOVPKvgZF3G3abJrUeR4rwzuaemfS0M4tiNS
   UEuAfdBSk5OiwB6HzHxIRcoKdABQNn0Ht51U9TZB6Mk+45aBOAsNL2eB3
   ZB91E0yWgncpEHzhE3mChNej30qXqmHfihEVHi8BcKfES+A9WrrjiDeVz
   MJR0YCMbpgsO7m5ARB3dvVXDjMGozVxjdGGg4c1R69FWwKWstJSDbd5bJ
   A==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665439200"; 
   d="scan'208";a="28331496"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Jan 2023 14:47:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 10 Jan 2023 14:47:47 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 10 Jan 2023 14:47:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673358467; x=1704894467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IANc8BcR8bv1o/X9X8afiNRzt7YZdqQIj355WEJOuWg=;
  b=azXDTwvIikIAFMlbMp1OMF8qWsR9OVEFmi7fowc8z5QQqgAt7758tn0F
   b2b2ieEV6uiC0pWEmhdKHaCNsJLbk2cTMIxkIg5hZ8GKXTaMF9BVefxuu
   FcNU7d9d4kZvfe3P/DZqhfDoC5PvC8PzZHYVvO9ayNFQtHGix0HMwawvn
   swuU+7Y7k+vcD0/8Vomh4U3VViu/iaESBEUe649SA6GUqXZKMppahU2iB
   pvA8vxy5bdljOjBLh3RaPUw/QQPPO/N0Mp30JXydtDwW4P5mg3gpFmFt3
   yljCwXf17Aazp/7Xce1uCBk1thX/rMozkAvimLqsebVvS49D+WWiUd5XV
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665439200"; 
   d="scan'208";a="28331495"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2023 14:47:47 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C114280056;
        Tue, 10 Jan 2023 14:47:47 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: rs9: Support device specific dif bit calculation
Date:   Tue, 10 Jan 2023 14:47:47 +0100
Message-ID: <2211925.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a2fd6077-a5ae-a694-3637-e83ca044da69@denx.de>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com> <3216146.44csPzL39Z@steina-w> <a2fd6077-a5ae-a694-3637-e83ca044da69@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Marek,

Am Dienstag, 10. Januar 2023, 14:37:19 CET schrieb Marek Vasut:
> On 1/10/23 14:22, Alexander Stein wrote:
> > Hi Marek,
> 
> Hi,
> 
> > thanks for your feedback.
> > 
> > Am Dienstag, 10. Januar 2023, 11:31:49 CET schrieb Marek Vasut:
> >> On 1/10/23 11:00, Alexander Stein wrote:
> >> 
> >> [...]
> >> 
> >>>    static int rs9_get_output_config(struct rs9_driver_data *rs9, int
> >>>    idx)
> >>>    {
> >>>    
> >>>    	struct i2c_client *client = rs9->client;
> >>> 
> >>> +	u8 dif = rs9_calc_dif(rs9, idx);
> >>> 
> >>>    	unsigned char name[5] = "DIF0";
> >>>    	struct device_node *np;
> >>>    	int ret;
> >>>    	u32 sr;
> >>>    	
> >>>    	/* Set defaults */
> >>> 
> >>> -	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
> >> 
> >> Are you sure this line ^ should be dropped ?
> >> Shouldn't the bitfield be cleared first and modified second?
> > 
> > Well, I had in my mind that this function is called upon probe with
> > clk_dif_sr being cleared anyway, so this does essentially nothing. And
> > the DIF bit is set unconditionally, so what is the point of masking it
> > before?
> 
> Good point, but then, what's the point of ORRing either ? Just do a
> plain assignment.

OR-ring is necessary as this function is called for each DIF output (see idx 
parameter), so plain assignment will clear the previously set bits.

Best regards,
Alexander



