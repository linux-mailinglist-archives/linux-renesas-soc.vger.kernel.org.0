Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D18C2180994
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2020 21:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCJUzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Mar 2020 16:55:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36091 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgCJUzH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Mar 2020 16:55:07 -0400
Received: by mail-oi1-f194.google.com with SMTP id k18so2342604oib.3;
        Tue, 10 Mar 2020 13:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TOiQ5UbbyIXOicEJpNk2SFlKtQ0SHScLOW4Mpkh2aW8=;
        b=a443IYaGQGVa5FECWs+NulWArNxZKRTtgtku/xCpkoXF0azVNGq3oiyHMXpPlvK5kh
         Qp/CD1pdLo9CIqxTf0qgA8lmLM4eQ9TAgH8zsLoOECyZWI9dq+4zZElgDmeCJlOuDU76
         H5FaHob/3M50louevjRNvFkCaPr0ZsGJVcUi7rc4D0LGRv4N70Zde59JuQ00kxV7wHmq
         o/iVb5S0fofP+pyKmOPH0mI4u6W40ds2hG1pfKvcd7/lMwqNxhk7qSH03qdYtM317rGE
         iG/qC1xxApp8OT1zGcCQNx5lxo6M8ahTGqrW1s76bChu0prU/z/Z35ZT7ZeuGEIjOT7p
         FHfQ==
X-Gm-Message-State: ANhLgQ2IvIekvz9ppwRUyRc6ooCiR/nRQD85b18SKxJ0Gaqme5phVBCK
        4AZcU99OxdH3C5lGoWyFsQ==
X-Google-Smtp-Source: ADFU+vui7mX/+yiQ3UwIwy1g8dC2BgC3jxA20Sr5Vdkmy1XrlDPk957Nbud3N5UrA2cbMDrUnleuqw==
X-Received: by 2002:aca:b9d6:: with SMTP id j205mr2630536oif.179.1583873705912;
        Tue, 10 Mar 2020 13:55:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h92sm4970984otb.2.2020.03.10.13.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 13:55:05 -0700 (PDT)
Received: (nullmailer pid 27349 invoked by uid 1000);
        Tue, 10 Mar 2020 20:55:04 -0000
Date:   Tue, 10 Mar 2020 15:55:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: clock: renesas: cpg-mssr: Convert to
 json-schema
Message-ID: <20200310205504.GA27288@bogus>
References: <20200303094848.23670-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303094848.23670-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue,  3 Mar 2020 10:48:48 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas Clock Pulse Generator / Module Standby and Software
> Reset Device Tree binding documentation to json-schema.
> 
> Note that #reset-cells was incorrecty marked a required property for
> RZ/A2 before.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.7.
> 
> v2:
>   - Remove complex if-construct implementing per-SoC clocks/clock-names
>     constraints; list all possible clock-names upfront instead,
>   - Drop Clock Domain member example.
> ---
>  .../bindings/clock/renesas,cpg-mssr.txt       | 100 ---------------
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 119 ++++++++++++++++++
>  2 files changed, 119 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
