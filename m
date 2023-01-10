Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53216641A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 14:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238249AbjAJNXJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 08:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjAJNWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 08:22:44 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF711B1F9;
        Tue, 10 Jan 2023 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673356963; x=1704892963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Y2ZgCFQqeWR9sr/Iv4ArzvWvcJPlpRahRJtTdwClPI=;
  b=SDmLHFhwl9Kcvv/zz+NqQIGqPAygA+UL2JNzKOmYO6m1dmDyK6wNiXrM
   brlTYeja8SVIw95TBj8+K26NfUDCfZby4uqOOxjXwQCCuFfe0CyBueChw
   Y7BVYq6/njMz2XJA5cXru+3xXIgkFjEEbfWIIi5BviCSXyAF3CcXxkx4Z
   Eou2nJUiWElYmi6O/H245T75w8ieI7idtoueWvBjWrkSYotnlX/u3NwNs
   AocwaMOnJ3yobrSuar7iV8bmmRjiWbUmFdiNWlLFW33DJpeoEG67yOy/g
   ZDyJdOcTVDUKwKNZ4UQJX9RFTPqMf69nYdTIpxhFIeGPeyrG5a+LfhG/o
   g==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665439200"; 
   d="scan'208";a="28330713"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Jan 2023 14:22:40 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 10 Jan 2023 14:22:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 10 Jan 2023 14:22:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673356960; x=1704892960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Y2ZgCFQqeWR9sr/Iv4ArzvWvcJPlpRahRJtTdwClPI=;
  b=pki3KCRABL8/BIH3Z1Qtv7Xpg6gnsflFydVI9yjR4RI/nNUp/HPewiDn
   n5tMGMASX/mztt3JwrA2rzoC+wP6wJ4VZVFJf8+GNvvDk6QC1qB955J56
   /95COUJkGyMjLsF+R4CkPAhpWstfiwmvLS+jOzIkuT5U4mHZzWU8Tds3Z
   GvwL11IxeJX4WEHBLlNb+EkGa1OFOf/mfQdDhEdOACs++sAOzQw2CR9XV
   TwpzH79sdq7ARo5ltcY1lWDWAcUOoch8OstrxPthJU6ymAwRH/iSZP3w+
   X0gxkTUBR/zVGeYeHXBank4WGPwy6NnKC5tOKpGb2Yso0ONaeCBiXbTV8
   g==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665439200"; 
   d="scan'208";a="28330712"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2023 14:22:40 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A712C280056;
        Tue, 10 Jan 2023 14:22:40 +0100 (CET)
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
Date:   Tue, 10 Jan 2023 14:22:40 +0100
Message-ID: <3216146.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <54e39604-088d-da4e-2779-4a635995db17@denx.de>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com> <20230110100003.370917-3-alexander.stein@ew.tq-group.com> <54e39604-088d-da4e-2779-4a635995db17@denx.de>
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

Hi Marek,

thanks for your feedback.

Am Dienstag, 10. Januar 2023, 11:31:49 CET schrieb Marek Vasut:
> On 1/10/23 11:00, Alexander Stein wrote:
> 
> [...]
> 
> >   static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
> >   {
> >   
> >   	struct i2c_client *client = rs9->client;
> > 
> > +	u8 dif = rs9_calc_dif(rs9, idx);
> > 
> >   	unsigned char name[5] = "DIF0";
> >   	struct device_node *np;
> >   	int ret;
> >   	u32 sr;
> >   	
> >   	/* Set defaults */
> > 
> > -	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
> 
> Are you sure this line ^ should be dropped ?
> Shouldn't the bitfield be cleared first and modified second?

Well, I had in my mind that this function is called upon probe with clk_dif_sr 
being cleared anyway, so this does essentially nothing. And the DIF bit is set 
unconditionally, so what is the point of masking it before?

Best regards,
Alexander

> > -	rs9->clk_dif_sr |= RS9_REG_SR_3V0_DIF(idx);
> > +	rs9->clk_dif_sr |= dif;
> > 
> >   	snprintf(name, 5, "DIF%d", idx);
> >   	np = of_get_child_by_name(client->dev.of_node, name);
> 
> [...]




