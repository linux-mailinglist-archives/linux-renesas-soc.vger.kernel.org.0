Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1526765C127
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 14:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjACNuH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 08:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbjACNuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 08:50:02 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6EC11477;
        Tue,  3 Jan 2023 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672753801; x=1704289801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WpLDfQkVCsUYAuYxOb9Sk3VMgL/XIHPK14s28skQZk8=;
  b=iV7PCCkkC1gwyxqpenm0ZJFU5WzoXyww9fPDsM/IIt9PcePnT4vG+fvK
   Okv82wiesCgB2DBtA5VH1McYRaGDqr/iMsBeER2b0XboipbRm34wdMogs
   M+pTUj88jbNT7EoskBFYm04DOh0ogPWhsZUqmhBmXTju+2nBnYd5Kysb2
   Tr2baWDvOyWweWOSvtZ0NsFYAspzzNLHF/C3cPOYLsqxFDItgAqUlrq6y
   W6dFUOiprrd4iaoS/O+BH0m+W6Vqf1t/Yd0Ym6A3YYLvjnqJ7jTdqQ+Bo
   c0NMzK8Wf7Rj08KFppqA9P3hfenWwtkZXN3KeVZP3UvoaDnvKPj25hXJG
   g==;
X-IronPort-AV: E=Sophos;i="5.96,297,1665439200"; 
   d="scan'208";a="28222612"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 14:49:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 14:49:59 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 14:49:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672753799; x=1704289799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WpLDfQkVCsUYAuYxOb9Sk3VMgL/XIHPK14s28skQZk8=;
  b=FBR76nUyKbCaRiwWKPoiJhPeevuDXc3Cr+2Db+xNCNm/XikGf11SoOLq
   XO0lauRxix6R8BHnBZj3MEsCNQ/U25zpHPQR5EjVCRnteN1LOO5px0UFi
   O3NC1hnAIzORAAVV4Gdr8Btr8lQceB64Gfo0h/v1As1w1IeGVsY3p9MZy
   Sb0vKYvjNnKQN4TEdevnOfGe2ITJBGSmdm1iHsr0jsunvDif7Z0Z7Ve3m
   zhWbEQtvGEwMCQSVzAquMNhexoJGnvpnSimTiu4TydlQkf4zpuYsoRFsh
   9i/UcR7O2L9z4ihG+FhSInYJgLPXgT35mwL9r0ljDaHFVeCRyOMso+oC6
   g==;
X-IronPort-AV: E=Sophos;i="5.96,297,1665439200"; 
   d="scan'208";a="28222611"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 14:49:59 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E08D5280056;
        Tue,  3 Jan 2023 14:49:58 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clk: rs9: Add bindings for 9FGV0441
Date:   Tue, 03 Jan 2023 14:49:56 +0100
Message-ID: <2306967.n0HT0TaD9V@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <0d106f4d-4683-4117-0812-e83f8e5974c2@linaro.org>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com> <20230103123154.3424817-2-alexander.stein@ew.tq-group.com> <0d106f4d-4683-4117-0812-e83f8e5974c2@linaro.org>
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

Hi Krzysztof,

Am Dienstag, 3. Januar 2023, 14:25:19 CET schrieb Krzysztof Kozlowski:
> On 03/01/2023 13:31, Alexander Stein wrote:
> > This is a 4-channel variant of 9FGV series.
> 
> Subject: drop second, redundant "bindings for".
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks, will drop it on next version.

Best regards,
Alexander



