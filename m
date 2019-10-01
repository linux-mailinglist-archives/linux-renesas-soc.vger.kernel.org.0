Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CCCC3609
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 15:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388170AbfJANlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 09:41:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34825 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbfJANlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:41:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id x3so14447435oig.2;
        Tue, 01 Oct 2019 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tB7ZzI9slzRkyB/NKt2yLakwQz4oIAuNh1K5WH9EW3I=;
        b=m4TEs2vmzCiDynZ2QUerNqE79FYMqyDK2B6iYqa6am51WowrwIiQ8k1VmVPzkZJs5/
         QbDwTUuto2RbQ9Dtd74PFff47JvzQwaMu36LEW9Wy9KeOwQIBzNZ8xcWBQZwPHsHbo38
         60f8Zm1PmpViDJ8Fw06oRv/+JarQwDh+iS8E4nllIARYFotGVeRhjNA3iqXaR5FDcIAq
         IMEJLCJZ2kLgzP+6W6vYD+Sr+GgnmkgoCeS5m3VsJoEc8WT7BL/eRrVRiDWoNjHjoAcs
         atrjtbcZqDZ/I9LKFYZb5vvDXD/4uxH+ct8oPynpcfLvNDM8IYfqJi0KYkT4ivNujFuQ
         0gPg==
X-Gm-Message-State: APjAAAVaxvoppLT2ig+xxUMeRQN/iuyQMn0cGHi8ND+rf+14mI4qStOU
        I7M4HqUG6QYTlWSGOX47Qw==
X-Google-Smtp-Source: APXvYqz0OL9phdAxhE5mqvW9HwiUlHK1JCHdfaZJBoU6zRW18R8d9kkbTRTQjigQdMRgjNWNNOhjLg==
X-Received: by 2002:aca:58c5:: with SMTP id m188mr3649522oib.74.1569937310961;
        Tue, 01 Oct 2019 06:41:50 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o184sm5301535oia.28.2019.10.01.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:41:50 -0700 (PDT)
Date:   Tue, 1 Oct 2019 08:41:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v4 1/3] dt-bindings: bus: simple-pm-bus: convert bindings
 to json-schema
Message-ID: <20191001134149.GA17853@bogus>
References: <20190930115205.25204-1-horms+renesas@verge.net.au>
 <20190930115205.25204-2-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930115205.25204-2-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 30 Sep 2019 13:52:03 +0200, Simon Horman wrote:
> Convert Simple Power-Managed Bus bindings documentation to json-schema.
> 
> As a side effect of this change only simple-pm-bus is used in example. A
> follow-up patch will provide an example for the separately documented
> Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> "renesas,bsc" compat strings.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> 
> v4
> * Only allow '@' after bus in nodename
> * Allow #address-cells to be 1 or 2.
> 
> v3
> * v2 was miss-posted as v3
> 
> v2
> * Add SPDX line
> * Remove extra blank line
> * Add $nodename
> * Remove extra leading space in compatible
> * Update compatible to allow override by other schemas
> * Allow #size-cells to be 1 or 2
> * Do not limit ranges or clocks to 1 item
> * Add anyOf requirement on ranges or clocks
> * Update example based on msm8996.dtsi
> ---
>  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 -------------
>  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 75 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> 

Applied, thanks.

Rob
