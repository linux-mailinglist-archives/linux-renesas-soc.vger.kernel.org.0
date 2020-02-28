Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E70173C08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 16:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgB1Poj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 10:44:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44558 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgB1Poj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 10:44:39 -0500
Received: by mail-ot1-f68.google.com with SMTP id h9so2937664otj.11;
        Fri, 28 Feb 2020 07:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KoiIU/7NeuH51ZSO1kw6MYzeD4acn58C27D4Ns+cWCs=;
        b=JkU2i83WUVLjqNk5xFROP4yG+Jg9S1/VxGi1ihR7YFL8RRef9m/k2fF9nCQESSzwl7
         79uexaDCZWdwo6i+XbdSl9xjTiXZLysUGnGzYGibYMmQtO/RBTnibQ+SGQVgivMcecNt
         2zSWLdfo6igHbDffzVf3ycQkLRt7hZp3/2LkHROgfaBhkt7vgvEIux2VHwK9G4ulEopg
         onNk7zRGa98FpCEv+hwY6ogSfXZEwJQ0XFbcwPMLzpPhInXyjHqmZ6soQFg2zuwRPb3W
         YlU18UkmuQfCh0v3kCHhfinqoveLhM1GfSqlE8Ys5RVEw7f9825kn3zT+6NTd+DeUgev
         NeIw==
X-Gm-Message-State: APjAAAULTQqXUGLUMoOT1pul43Hfgy0Jxn5O8iqH5M7Tprnos4oRXFUW
        VHkbyAtqGMxFQBj2HVQg3g==
X-Google-Smtp-Source: APXvYqyUk3b8og79WJ0FHNeFIIgmOTWG4Yxmpv12trTsCQLkFpYKlUKiDRhZA1/zm91LcDuRYNPhqA==
X-Received: by 2002:a9d:64cd:: with SMTP id n13mr3221114otl.274.1582904678476;
        Fri, 28 Feb 2020 07:44:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g7sm3216646otk.17.2020.02.28.07.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:44:38 -0800 (PST)
Received: (nullmailer pid 19552 invoked by uid 1000);
        Fri, 28 Feb 2020 15:44:37 -0000
Date:   Fri, 28 Feb 2020 09:44:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: power: apmu: Convert to json-schema
Message-ID: <20200228154437.GA19490@bogus>
References: <20200224135251.32157-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224135251.32157-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 24 Feb 2020 14:52:51 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas Advanced Power Management Unit Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop "DT bindings for the" from title.
> ---
>  .../bindings/power/renesas,apmu.txt           | 35 ------------
>  .../bindings/power/renesas,apmu.yaml          | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.yaml
> 

Applied, thanks.

Rob
