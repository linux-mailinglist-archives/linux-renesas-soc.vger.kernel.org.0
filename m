Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6BFA4FC7F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 01:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiDKXIG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 19:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiDKXIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 19:08:04 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE6560CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649718350; x=1681254350;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wuv82C+NThJ2LAyrvMNDY/iIjAzWwWVaRV90LnNl2nw=;
  b=YuAzAncOW8D/0Fg3LqxxsIje06zncFVC25vhv35AQVxNS+vtvwz9r2qU
   artGWunA+XDyAC7LRVbGsZfD9c14rXJfsThPBb/O4KCJAsnag4utkcI0d
   T8jZlrpDVhRDuAn7pFOm3lYua1/a39/Ue8dWo+FnlUQ2wF6cADkdalaA9
   FXk1v+5VN2qTgD1mJMprnWaI8fnK0XYPetzlNVQUx+LfkdL5Lq0ZcjhYe
   Qxqzyo/0AcO7hJfpYJjOVc/t5tbGfdUyNSejc3CVPGMlYBAD7zQg5bBr1
   Cl7N9cS/cizycF8Mgpj1z8lftK7YzfL5I8+OU0anWo5m/4ZgC1Lxwe1C7
   A==;
X-IronPort-AV: E=Sophos;i="5.90,252,1643644800"; 
   d="scan'208";a="198568477"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 07:05:48 +0800
IronPort-SDR: XxLzEHFzVpNsrTv4DhtD6dphjt/LVM84a6MZPds9gODR6eFWref/ex5GTjXoWshUihtxzTwhOh
 uESHxoqqP3y0McYh1d+0ShMzKtAyPJQIiV9G8smZwWhqjJUnFH9ze9xnjAmDeByQhpWn9tWomx
 +J5bHPiYvOGlvCPNxFih+93ohNgYiHPJBr9bmHUtfoTOJUiwih8OHBJb1wbDPDTZ82rMYjHEGN
 qEFP3Ot440sCKmUyye1Ksgd1KxEm2fcEo0T7W45R31WxGuJ84pPDOgJc+Ek2X81+mBmTZ0CHt+
 3t+yXXgWEppsI5CBN7rEXxXu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2022 15:36:15 -0700
IronPort-SDR: VeaY5oS7bpO1tpHQPWAS3e7UjV//lT+kcT0iKK71CLwZaAagJ8TrdOlWr106HJdj/4b4jJLBHR
 rQo018xFVo96dnLB63tmHKui+SlxoBM0FqW60py+QrIZI+DG11noB4P1Y4ZFmBSlRgWupH68VW
 0skRrRE0TvTRS9ezF7RnoJN4NLB5Vk9oLUkehaoRDqWsLzCkL4ttK7gxHGkFt2yBp8KmkVHibu
 Opf3X8S6tXRIDihgCeffGQ9KspIXhNdCuAxgw7E2I1v2nnQs/2E57rVsgRJyrJvvDCggHXTuJm
 b7I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2022 16:05:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kckwp21vXz1SVp6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 16:05:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649718345; x=1652310346; bh=Wuv82C+NThJ2LAyrvMNDY/iIjAzWwWVaRV9
        0LnNl2nw=; b=IzT1lVoemoVGtrP39rzKF5oNCmsWW7TP0fPaOwcx4bhWNZV9YVk
        y/HCqgVVG8eUEWd1slLrWl5ZW96xMz/6M/BnNEa6gsDPULtvagk4LQfWNGNejHIA
        3lCWOcMjQy3dp1zlD8TgrAt3dxl+6/BcJcQ7CRj0gPDFW/3hNqlm/E9yNckD/L+8
        pKH2d6fXyr3GU/WM+Ohex10z5TjyKmLpxsay4FK9dWe4gJ+slu4FYsAVaTMtgREL
        KGWOpjGXFYgPvnmAuWSF2m+tPVZWb4z0CxHYqq/kv1Nl+Dgku1GeAcFKAAnS280e
        Rm5VTbwLnch294YMOIhR8GHj8lxqGfIbhxQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id H6ytijObTCLP for <linux-renesas-soc@vger.kernel.org>;
        Mon, 11 Apr 2022 16:05:45 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kckwl70RLz1Rvlx;
        Mon, 11 Apr 2022 16:05:43 -0700 (PDT)
Message-ID: <4716ac8b-acee-da06-5fa1-34eed07ba4d0@opensource.wdc.com>
Date:   Tue, 12 Apr 2022 08:05:42 +0900
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
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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

Rob,

Will you take this patch or do you want me to queue it ?

-- 
Damien Le Moal
Western Digital Research
