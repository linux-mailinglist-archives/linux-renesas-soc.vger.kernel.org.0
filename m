Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760CDF23E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 02:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbfKGBAA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 20:00:00 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40981 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbfKGBAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 20:00:00 -0500
Received: by mail-ot1-f65.google.com with SMTP id 94so507376oty.8;
        Wed, 06 Nov 2019 17:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FN44kRKaO3Gsa4potYnqkgJpQ2TS788EdV4B7lv2z/8=;
        b=hPMj1Hc6iLCBHRQNHrIavos0ek9NlD0HYQ0AgsrVLFCjbJ5H9vYc8KaQ/yNDvYgqBx
         jwngLHqvL8ACfHShn24CVXff6Y2xpMImVrDROehcfFLR34n4njG7nry7q/bR2NIQc8oO
         5TGMx6WTR2UpVW3MxPXFBRrCcUHzkRCWRn9yhAi6ltoohnOoZVU9QEkiqm5ZNlkwP3dg
         d2DKgBMJf/sOHY9FI6Km8kCGJ6UtFJOCDwHKZioVuIMaP+gSw5HTQpr5PpQuvjWfInmj
         EF6fuMTRMFCr1+JxWyP2Oj5vj57ZVLOJ1KVFT8D2Zd3klSN54zBHCWilAKhgu+SUf1KH
         Gh4A==
X-Gm-Message-State: APjAAAVeIeDZQtjHZMzWkedSaPJloP04y7wWai0cICHkWu2GT7MDnEgN
        E2GhEPJ3w5cBuhdlwoGlI2If/Fs=
X-Google-Smtp-Source: APXvYqxibH5LsfYpkuSL5n4rdPpW5Yjeowx7nEM39WMhXt3BZwYZDrUcuQKTTR1RuNibH/PTELe7UQ==
X-Received: by 2002:a05:6830:1d52:: with SMTP id p18mr596157oth.130.1573088399553;
        Wed, 06 Nov 2019 16:59:59 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d3sm229665otq.25.2019.11.06.16.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:59:59 -0800 (PST)
Date:   Wed, 6 Nov 2019 18:59:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas: usb3-peri: convert
 bindings to json-schema
Message-ID: <20191107005958.GA3612@bogus>
References: <1573036493-16525-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573036493-16525-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed,  6 Nov 2019 19:34:53 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas USB 3.0 Peripheral controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Remove oneOf from compatible.
>  - Remove comments from reg, interrupts and clocks.
>  - Add maxItems on phys.
>  - Remove generic.txt and graph.txt references.
>  https://patchwork.kernel.org/patch/11205923/
> 
>  .../devicetree/bindings/usb/renesas,usb3-peri.txt  | 65 ----------------
>  .../devicetree/bindings/usb/renesas,usb3-peri.yaml | 86 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
