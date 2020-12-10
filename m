Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C31F2D5112
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 03:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgLJCxa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 21:53:30 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43716 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgLJCx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 21:53:27 -0500
Received: by mail-ot1-f66.google.com with SMTP id q25so3539128otn.10;
        Wed, 09 Dec 2020 18:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VEF46AksQ3Sl6Ae6nSVnW2tRZyyX7SQrrCbNZgol2Dw=;
        b=KQe14q4OnqGvU7AuBdPnBG9I+Ldq6Ty2SxsI542vszHSdcuF3PMl/VVJbEzg1qbzM6
         NWTl5X7LegQJJZNuOfA0PRXcF5qj41ZB280OSFBKRZ1u7ZUs38K+GP4byl7NLoeE29cW
         pTB8rTiTrORcDxWP1iNeAX62Ko78xUUUYAbTCLYVvJC3O0lFs1c4IbDKyRdhGmteGtZd
         52k/cEXQMA4dyX4snmpjEA51kn4p+YRDIAIPuRFs2t3veMZfsTC3KPWEIeVE+97+vEnl
         n47RV30ZFbJBHp2q6gakHwsdZr2CFwOAuwn/A6ueohAZpPmf7UpHINe9YuNBshNFcsUS
         APIw==
X-Gm-Message-State: AOAM532uzsCZJiTdUrfmCPq6O55N+vYGaM3DHPs5Ttw5HYGK1HMbvYaB
        E0UDRAZ8UP0t8rPXA7pj3w==
X-Google-Smtp-Source: ABdhPJyjEHERfTZbK1DvW3Mffba6/8zoPPQA/NKjV1apq/0QPS+zs7RhyBwMvoCDYg0y+nC+VPlq/g==
X-Received: by 2002:a9d:2946:: with SMTP id d64mr4331307otb.214.1607568766348;
        Wed, 09 Dec 2020 18:52:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i82sm728366oia.2.2020.12.09.18.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 18:52:45 -0800 (PST)
Received: (nullmailer pid 1547720 invoked by uid 1000);
        Thu, 10 Dec 2020 02:52:44 -0000
Date:   Wed, 9 Dec 2020 20:52:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: timer: renesas,cmt: Document R8A77961
Message-ID: <20201210025244.GA1547670@robh.at.kernel.org>
References: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209195701.805254-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 09 Dec 2020 20:57:01 +0100, Niklas Söderlund wrote:
> Add missing bindings for M3-W+.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
