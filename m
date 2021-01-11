Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D29C2F207E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jan 2021 21:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391532AbhAKUPN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 15:15:13 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:37302 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390529AbhAKUPN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:15:13 -0500
Received: by mail-oo1-f46.google.com with SMTP id p72so48515oop.4;
        Mon, 11 Jan 2021 12:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1jf8O3OkI1IdBPDAL3MB6SdZXjrak+vWl33TH3HPC80=;
        b=oA+gvut9IaS/RFqr6gKBSqQn8rVStMzikFDYY+bRismEiRXqDvwpYe7vhh0zH05exD
         WGNHRLHcBtGdp8AlApYgg4iB9UYiWWkqH35UY6Z7UBjanb+jsz4iI4BYS2GFcTGzasKi
         h9R+psJpoX0ZJMClcrdSI2lCkpYLm8ter+BwJwegKWObGFgBO9MNpBTdHyZpmq+2jV00
         kgm6fbR/umPTtsIz0TaMnmEqKjnMjQsP8bmOQmA9ByDSdbWrnqEOXi1EcwJ2F9LdcY7H
         v7pEaG9yAAjpbQPeiARv8cJOzLauYwb3ctWAtfwYapbzwIllOTy7/AgUNlQ4eHeQApC0
         3Z8w==
X-Gm-Message-State: AOAM532j6EK02DMkOfdkXBt4zNlHMVctN2oJN/Qv9tCkogINXPQa1ozX
        Yhsvaj1hdvaAuqmuFVKZnQ==
X-Google-Smtp-Source: ABdhPJwJPWix0clGFKvlgFZYTIsCRBKuuukk4mLjT/oHxPxPNF1kqBLafKMi5EVRzKi5gNrNKw+rMw==
X-Received: by 2002:a4a:9c5:: with SMTP id 188mr629655ooa.77.1610396072539;
        Mon, 11 Jan 2021 12:14:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u141sm169327oie.46.2021.01.11.12.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 12:14:31 -0800 (PST)
Received: (nullmailer pid 2993508 invoked by uid 1000);
        Mon, 11 Jan 2021 20:14:30 -0000
Date:   Mon, 11 Jan 2021 14:14:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        aford@beaconembedded.com, Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Add support for RZ/G2 M/N/H
Message-ID: <20210111201430.GA2993479@robh.at.kernel.org>
References: <20201228202221.2327468-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228202221.2327468-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 28 Dec 2020 14:22:20 -0600, Adam Ford wrote:
> The datasheet for the RZ/G2 Series show the bit for choosing between a crystal
> oscillator and an external oscillator is present.  Add the bindings for
> r8a774a1 (RZ/G2M), r8a774b1 (RZ/G2N), and r8a774e1 (RZ/G2H)
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
