Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3E550039B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 03:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiDNB0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 21:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiDNB0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 21:26:00 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A3E52E47
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 18:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649899417; x=1681435417;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gTiDrR+9+HtrXE6ySpJjfWH7TrMfuwUMNxxOhskx1yg=;
  b=r6roO7YWZ82rUjf+HQR9gvzHHlplnLMUWP6pqX7Q+tHio3qUz/oLpERk
   lQlzEX9VdTI4Ywx/OYDUeKTXJo2Gu4q4ni73cfEg+GU2dunw7ihoQytBL
   BBvhSrFlsJMrkpAgSjg0zEy3A3hvCuSuzX8ZruuSZUlfHQUEJAUhN7yTI
   yIEL5Bmq6NgPP5LVIoOHPJ9tXqqDH503an/17JySVDs9TBjBH9RE72cQT
   8+LAbl0N0FNP6WyGkOXCy2Z3YzjwDlieg0JWx+MhZ4DKaALub74kQDMmy
   ivwLVfrKhAEwEFjaaiNaTmyMHfglcof4IXrzXEKKAlgv8vSAWDVLvIgve
   w==;
X-IronPort-AV: E=Sophos;i="5.90,258,1643644800"; 
   d="scan'208";a="197870345"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 09:23:34 +0800
IronPort-SDR: jVOzdIdQd8KxJGEK6heAley9SHSPZh25qyhZ2p+TR4Sf4iEgFKWbpjrwcLSYsWJL0IRKECgAzr
 M25fFb+3ZxL2o9rqlswZeJgk+SKFbM7QsO7WvgEfTaHYIwXzo9bs1eiVsgAkCayagfUE5WZqeX
 ocdKH5BHSvy937EQQ0mMjw2ilSllCUy9zPimn98ORQbO+AA047mw/BqENv/cvcBL0o7CJqy8VA
 gV0B7Q15LE0hYlp2OYOSNEd4HMbw4NQaPvpzyAIlfBnFF5iK9Kf91A0PMr9gqO/joHYS3Hkh8X
 fRHPx+ZbZMWpkB1IOba9ygY+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Apr 2022 17:54:00 -0700
IronPort-SDR: C+H0QAn7FsBBrCmutzrDGJ1+0cOJNpuPM+q6WE8KvR1/wbummCBbY2yLHinFmd9eKjJ62mZDsD
 gjquQGPoKby2DdOOk6k7MSZ0DKyyBYRtV0iE4czj+TBw8P7llK4QaWG1m11kyHmpdyvOQ2aHxy
 7AZNWJMHxOvvLQQs0hNnpnkfIb/k9p3i87P59Z87jjhTn/qwS80/4i3rLEKskuSeSGqU2CY3Co
 qcO0yRVRz9hj8+fe+zXkpAxcRtCUqyFSRCI725tvW5B1NzxcmI6Hn+r3WyDEJjc53LW28lay1B
 JHM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Apr 2022 18:23:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kf1tt05nbz1SVp4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 18:23:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649899413; x=1652491414; bh=gTiDrR+9+HtrXE6ySpJjfWH7TrMfuwUMNxx
        Ohskx1yg=; b=dgQLps56fZW7FKENltVyV6c2ImBMbpr2Gd//Mb1NOGbu3vE7NZ4
        wk/ZVv5EjehGDxAa6PfKLqLgl3rYFaYP4bEym9Yx7BbSWcCVlVkHyEGc0bAaNJ6n
        FU+RvrTdZ+0jfG+O66/SlIYxNKyCc55fesCu1vmMW7sg3R5MMqsVQeGXiPgnxw/6
        wxu5gS4ZW+TKRogkkTuzk0ty4SVxu5N+E/FBiw09mgPhrS4omYnz7qqjMnO2QoSv
        FNY1rZsPP7Y9AbLdBnSVKaLvmXJ1YE0JR7HiZf+/2aWWiepNl4GygvWjgVIp3lEw
        sgw1+llmfQrx9FT/nM2kM1zWIhkty82Bp9Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id rfyc0iLOeJ1Y for <linux-renesas-soc@vger.kernel.org>;
        Wed, 13 Apr 2022 18:23:33 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kf1tq37zQz1Rvlx;
        Wed, 13 Apr 2022 18:23:31 -0700 (PDT)
Message-ID: <95580a26-8595-1fa1-5e3d-112ceb767ae6@opensource.wdc.com>
Date:   Thu, 14 Apr 2022 10:23:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED][PATCH v2] dt-bindings:
 ata: renesas,rcar-sata: Add r8a774e1 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
References: <5861565a79a2bdadc07ae84e23e6d96dbb764823.1649680949.git.geert+renesas@glider.be>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <5861565a79a2bdadc07ae84e23e6d96dbb764823.1649680949.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/11/22 21:43, Geert Uytterhoeven wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document SATA support for the RZ/G2H SoC, no driver change required.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

I queued this is for-5.19. Does it need to go as a 5.18 fix ?


> ---
> v2:
>   - Add Acked-by.
> ---
>  Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> index c060c7914cae6573..c4e4a9eab658056d 100644
> --- a/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +++ b/Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - renesas,sata-r8a774b1     # RZ/G2N
> +              - renesas,sata-r8a774e1     # RZ/G2H
>                - renesas,sata-r8a7795      # R-Car H3
>                - renesas,sata-r8a77965     # R-Car M3-N
>            - const: renesas,rcar-gen3-sata # generic R-Car Gen3 or RZ/G2


-- 
Damien Le Moal
Western Digital Research
