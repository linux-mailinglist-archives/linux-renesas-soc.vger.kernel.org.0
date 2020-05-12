Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311821CEA59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2020 03:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgELB5s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 21:57:48 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:41772 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgELB5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 21:57:48 -0400
Received: by mail-oo1-f65.google.com with SMTP id t3so2383359oou.8;
        Mon, 11 May 2020 18:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=00kOp9ExmdOEb2m+UR6ZmOPdOYVhMumUnUk3jnpY3fM=;
        b=G4hGY+FMaPOfGU8jevafQyTksi81Vf0D+3JvmW2WGc3fkoQACQUEdSv1v7gnQGqFar
         3zDMXamIefPv83QIiKxIcbxSwIVJPyNIOxLjFDZ7zp25uvHe/R2iXXWRIGmS24fn0Sv9
         cFDL4aET/SRAZLccO5pODsrRgUHXWGcfZXNXRhkGSQIi9Sfu63Pvdhlk6pjG0mw85+bi
         W8mVj89KID5byzf6T3mF+zA5LCbChu0Qp1EXztm1OQrC2h+LmUmWMopdraAwASLr4Qq+
         qNMSgIwz5ZulMdYmiNd/EFw/mmbCyLNmDXQ4Ut06GnjEJS8MtZGQrl3OYkGIytZMlajq
         erPg==
X-Gm-Message-State: AGi0Pua+HG+bWAy4RbIUlIM39H/+3+XZ85esU1Q690PwWYT9rFPYcfxp
        e34zRtQHbypyodsARIVRYw==
X-Google-Smtp-Source: APiQypLVvE1qKMDCU4a7JudoWuDD5bs0jk6oxiKcKgyBAPrg3Y8unux/pWp/iq+9KH+E5bd84bhtVQ==
X-Received: by 2002:a4a:615d:: with SMTP id u29mr16314383ooe.15.1589248667406;
        Mon, 11 May 2020 18:57:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g6sm366903otj.6.2020.05.11.18.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:57:46 -0700 (PDT)
Received: (nullmailer pid 20999 invoked by uid 1000);
        Tue, 12 May 2020 01:57:45 -0000
Date:   Mon, 11 May 2020 20:57:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas: ostm: Convert to json-schema
Message-ID: <20200512015745.GA20909@bogus>
References: <20200427193224.29548-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427193224.29548-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 27 Apr 2020 21:32:24 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas OS Timer (OSTM) Device Tree binding documentation to
> json-schema.
> 
> Document missing properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For a clean dtbs_check, this depends on "[PATCH] ARM: dts: r7s9210: Remove
> bogus clock-names from OSTM nodes"
> (https://lore.kernel.org/r/20200427192932.28967-1-geert+renesas@glider.be)
> which I intend to queue as a fix for v5.7.
> 
>  .../bindings/timer/renesas,ostm.txt           | 31 ----------
>  .../bindings/timer/renesas,ostm.yaml          | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> 

Applied, thanks!
