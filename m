Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C29E4CEFD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 03:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbiCGCy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Mar 2022 21:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiCGCy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Mar 2022 21:54:26 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A5F32ED4
        for <linux-renesas-soc@vger.kernel.org>; Sun,  6 Mar 2022 18:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1646621614; x=1678157614;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y62WpaxeS4cVBsbXW5GR5vErFGgAo8U5O+t9Nv2EnCs=;
  b=K2D5J9ND35NJ4BQGhAg1RuROBxDdupG74Tn6uq2cgJvf9ubSvc/octW5
   rE5FNtcQwJ/SedqJOMMrl3DaxqDSP/h7jy6fRBHuG1tUl9JAOIe/vKRIv
   NFzQukq+upmqOOrcxt1YAmUoGTQxPsfst+W+U6csB2+c2pW4T4ZLykuf9
   cjcVy6zz8HoHXjpT/i7TpM+9tOATKMnmK8/i02yphoj2o0DIp99rYik4h
   oLuqaMGjzq+5d61YCsEsoSwUb2Lvno53cC0HbGdUmig2Tm/92IaWKIuDf
   O1XooGNIgV++iYup9EijmkGIO9RR12bx2s7Pn8ngHOQxTLH0Zd/FpnDwI
   g==;
X-IronPort-AV: E=Sophos;i="5.90,160,1643644800"; 
   d="scan'208";a="195583695"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2022 10:53:33 +0800
IronPort-SDR: FrXRBQ+rHPO7cbwsHonfci8k2CQuYp8OHZRZwH7iMNFW2cGeGjmTR5STetdzQm4yTlzqBbT+iF
 ltLUpfwcJY46YQ8TDKsQ1M48hCAYMJzfcqSmXrhVEJekalDYrl7g3WN6v3/tVYK1EE0atGSpfK
 15G1HU2Rx64hU1hftOGN9LTaAXbAW4HP1OdWb/lY1+7iXu4KVpzDC+pfAqqKWZQjzxvoIkTViB
 ghoXurnvzp5bTij2ZffWkXSNmEX8oMzDtxwjgB97xoKQKNP/kEp2ilKFivvXaBC8HmaTplsNW/
 YBayRU9roj5FY3UjCH0p9rmD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2022 18:24:49 -0800
IronPort-SDR: s99IUxfpRpjnh73/C04RcgMqZwjWAkJnGKtHNuuVPfRZzD+TsNDFXRmNl/04DSJUBcXAJO3d99
 TL75TsnEcpSNG2h3eWvkdQCSj6/gM4HJ0bfRq85tFvKbONent4bs6erzRx2RLikXg7bnQFzrV5
 0ZL0XbZAlVNm33w9gc2aPIjNwrGgt3rF1GGgK55OiV09p5ZTS2rAYBOR2E4AndA8usgOUYIWh8
 /6ulVughlcr5V7A1ITYHYTPl9yoihWhwdInbtl+p+troIa/ZX2Q0mdmnri1lqkkke1WgLfJ8kN
 k+o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2022 18:53:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KBjhC5xQqz1Rwrw
        for <linux-renesas-soc@vger.kernel.org>; Sun,  6 Mar 2022 18:53:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1646621611; x=1649213612; bh=y62WpaxeS4cVBsbXW5GR5vErFGgAo8U5O+t
        9Nv2EnCs=; b=oi7rfMfp2K+hCqCRWCTRNVfkMm3GpBZwRoJyg44h48EXC7aBGgn
        EvnYrIlZW2t/YVgOU1cMowTtK2sRjM3fl1KOqGIb7Gz/FOh3VUdbfY+x7BUlDC5g
        HUnn8lEgD3oc8e81cXFUEBSJIbW6EUwKalhVr+UC5VLoCRioxxgSNV5LsHqQHyzE
        vYUxnUP/kh9A0qwXqtrJDACcu+RaOYSQ5HHhjaD35Md48X01xEoPO+XxVeM4BNry
        JR9ozCE/0F1P14OJIp2Q85UlR4PQmX09G0aQMPcXjfrWge/dOo7VPMwIx3Vt5pMm
        1LtdS4R5dctPObWUpXu33wrsFQtvKNhW7Cg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 8T4it39UptIN for <linux-renesas-soc@vger.kernel.org>;
        Sun,  6 Mar 2022 18:53:31 -0800 (PST)
Received: from [10.225.163.91] (unknown [10.225.163.91])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KBjh93Gnbz1Rvlx;
        Sun,  6 Mar 2022 18:53:29 -0800 (PST)
Message-ID: <736a2fae-9bdb-ff44-6340-4e556957cafd@opensource.wdc.com>
Date:   Mon, 7 Mar 2022 11:53:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ata: Drop commas after OF match table sentinels
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
References: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/3/22 17:36, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Add comments to clarify the purpose of the empty elements.
> Rewrap entries to a single line to have a consistent style.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com> [ahci_brcm]
> ---
> v2:
>   - Add Reviewed-by, Acked-by,
>   - Rewrap entries as requested by Damien.

Applied to for^5.18. Thanks !


-- 
Damien Le Moal
Western Digital Research
