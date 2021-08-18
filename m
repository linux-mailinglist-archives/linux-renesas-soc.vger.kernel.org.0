Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57AD3F0680
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Aug 2021 16:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbhHROWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Aug 2021 10:22:47 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:43763 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238721AbhHROW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 10:22:29 -0400
Received: by mail-ot1-f51.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3875457ott.10;
        Wed, 18 Aug 2021 07:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uRqk+U7P8CB77+InoBKd76nld+/UqlRHh0k0BtJQUQ8=;
        b=bG87FOoAukQV5Tsss1yzvGrINE6pjSZL/FxuMaWmeZoVKecOBFiyvsyC79k+4FWOxV
         CmzbMHm0RP4YyiQYsHfPyHChPRY/hsGMjMNTffwoiSCmwpU9eQYYZU+vj4QqYFb7Skvk
         R0bHZSmRzlHGvDCIKx0RW42T7iVvYgwOX1j5q+04Z0sJQO74fr+yHn7qvBaMhuAL8yUq
         5ah65lBphFRyvkXhT0JOE9loe2Ca2GxtiK55l0ktAt3onqJidomjoFQdVT0ylw0zRjPM
         1EfEPzVnD9pDS3dli+5ZtvUjlfAFwUb5uQQByzcn1QV2Vnz0QMqdi7thn2ABZ+Hsvzfl
         OQkA==
X-Gm-Message-State: AOAM5308dxsmxDtoEr9p22ws4QBf8U/jWkGAGomk8Z4uc85AZ9zvZ79/
        LMvkT56Gtwi87MbG9vbEGA==
X-Google-Smtp-Source: ABdhPJzSzGdu/UzM4VbciQ2C3+HRBHgm9WJK5uyZJJMUXc8CEkTRW/XQUnWI8D/ExXJCahhQ+KC8ag==
X-Received: by 2002:a05:6830:10:: with SMTP id c16mr5994728otp.63.1629296514636;
        Wed, 18 Aug 2021 07:21:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r7sm891524oog.48.2021.08.18.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:21:54 -0700 (PDT)
Received: (nullmailer pid 2546705 invoked by uid 1000);
        Wed, 18 Aug 2021 14:21:53 -0000
Date:   Wed, 18 Aug 2021 09:21:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Message-ID: <YR0XgYKSii7R3kHR@robh.at.kernel.org>
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
 <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 17 Aug 2021 10:03:13 +0100, Biju Das wrote:
> Document RZ/G2L SDHI controller bindings.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Defined clock-names for RZ/G2L SoC and make it as a required property
> v2->v3:
>  * split the patch into 2, first one for fixing dtbs-check issue and
>    later one for documenting RZ/G2L SDHI bindings.
> v1->v2:
>  * Fixed dtbs-check issue for RZ/A{1,2} platforms.
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 73 +++++++++++++------
>  1 file changed, 52 insertions(+), 21 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
