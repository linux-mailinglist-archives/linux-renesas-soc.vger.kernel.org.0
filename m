Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1E5C360E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 15:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388591AbfJANmG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 09:42:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38707 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388461AbfJANmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:42:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so11554759otl.5;
        Tue, 01 Oct 2019 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z5g3OMYil/Pu4EHQqTreHjtH9uByNzTm/aKtAT971Ls=;
        b=VzaWXYJQIoS96mRHd1YnxYgvmD4k6ma0E4uawrLG19kFPiaHXp7jDtFKFdqOoXKRlF
         MH6L6yQ8b8RN+4ruwXa/7AyU42RWorK8j/6F0oGQnKSzdcZ0dxsr1QTg7asKvbB+HmQL
         Hjeow8rFktrN3eqLLSawVIk4GqxNvdCNYXhWRj0eqCGQy25CfxlOMdyJagusuBJwyG1y
         7+ruOz5Q2GgHTzz8Peg7725tsbijGEIuPFcgCzm27MPCxVio7tDv0Z90QDEkJ9tNkLuT
         zb704qTeeEwxoaGr6HeKY9t1hXrV/Sf+UHx0g4f4b811Hk3iSzMPU8X8A4LxPJCm2HGa
         cEjQ==
X-Gm-Message-State: APjAAAXWTVIZbC78DOqew3BpJfzy/KTHGs1HqnPeqPZGz3b76BGu19mv
        jvdTnMhPxtuJTIluuxh5Dg==
X-Google-Smtp-Source: APXvYqxEaJDxVi6Sxv9072uC36hiUxKK+RBrbr3oPqy8AXhHQgVt5xejY+elj9reem4AkueuoKOJzg==
X-Received: by 2002:a9d:2902:: with SMTP id d2mr17596432otb.333.1569937325089;
        Tue, 01 Oct 2019 06:42:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o23sm4852036ote.67.2019.10.01.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:42:04 -0700 (PDT)
Date:   Tue, 1 Oct 2019 08:42:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: bus: renesas-bsc: convert bindings
 to json-schema
Message-ID: <20191001134203.GA18401@bogus>
References: <20190930115205.25204-1-horms+renesas@verge.net.au>
 <20190930115205.25204-3-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930115205.25204-3-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 30 Sep 2019 13:52:04 +0200, Simon Horman wrote:
> Convert Renesas Bus State Controller (BSC) bindings documentation to
> json-schema.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> 
> v4
> * No change
> 
> v3
> * v2 was miss-posted as v3
> 
> v2
> * Add required field as suggested by Ulrich Hecht
> * Add custom 'select' in that leaves out "simple-pm-bus"
>   to avoid matching on users of the binding documented
>   in simple-pm-bus.yaml, which this binding extends
> ---
>  .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -----------------
>  .../devicetree/bindings/bus/renesas,bsc.yaml       | 60 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> 

Applied, thanks.

Rob
