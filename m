Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E50E7E02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 02:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbfJ2B1w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Oct 2019 21:27:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39766 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbfJ2B1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 21:27:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id v138so7619621oif.6;
        Mon, 28 Oct 2019 18:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TEulik8cnhQ+VqODNguMZ+O09MeXVI0Qyw3vC+O/bsA=;
        b=NFX9Mql4DD6IQIvdamCufMWv6v8RWm8Utn9kNkeZeFHK9aaGdlatm3bVVpcm+yWf9z
         BkKetcU6sPGE8U92WPwVLzRQO1TxVJuyxQkQAziYtouq3Hrbjazh89ri/1rzvql8vvO4
         L2QMFFR9eJE+3qHDl/TC1krh5MmDTKSnhTt4cx8tNdEoTN783HHpXSZ3c55LPvbp5G3I
         990mXK8npKE0yUv1d6gyCOiQ1bUNZ9dnL+2mYA/iuLnmdRJqH3DLBgxc1Rdr6JzU8BsW
         tVxG88LI73zB6FMkI3WA5Wr5Ysfq8xRshkUl/K9EBfMHiwdMwZxw5t+SraAwma6ATeK2
         Pb2w==
X-Gm-Message-State: APjAAAWLhwAt+rq7YZbVIAtAQOA9PdydtfwFZxBtTw5aMWncO67vXJPJ
        4aPLLb5YDtrs34o1h91Ufg==
X-Google-Smtp-Source: APXvYqwDcCkqpZ8q4ekbZuZqKsM8FBF3v6KEw83zBxUXFFvbt3dborLzAvNtvweRT+511cQ5mflMtg==
X-Received: by 2002:a05:6808:aad:: with SMTP id r13mr1717377oij.169.1572312471469;
        Mon, 28 Oct 2019 18:27:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l32sm1507528otl.74.2019.10.28.18.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 18:27:50 -0700 (PDT)
Date:   Mon, 28 Oct 2019 20:27:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix
 typo in example
Message-ID: <20191029012750.GA25620@bogus>
References: <20191016145650.30003-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016145650.30003-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 16 Oct 2019 16:56:50 +0200, Geert Uytterhoeven wrote:
> The documented compatible value for R-Car H3 is
> "renesas,r8a7795-rcar-usb2-clock-sel", not
> "renesas,r8a77950-rcar-usb2-clock-sel".
> 
> Fixes: 311accb64570db45 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This binding has no DTS users in upstream, nor in the BSP?
> ---
>  .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
