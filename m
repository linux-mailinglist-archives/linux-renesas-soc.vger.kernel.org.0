Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDD5E902
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 19:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbfD2R17 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 13:27:59 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44643 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbfD2R17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 13:27:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id t184so6449431oie.11;
        Mon, 29 Apr 2019 10:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lTqzq9hf+Gl0VGUp28DMpfMmMtzIgbFsNlr+xXKeUYk=;
        b=LHdJmysK1crFCrbn0zzO61akPkTaBYfg+UfftfGmCVE3p50BZOHgt6jdaFgp1bC1EX
         yCX9gTY29SyVDt0F/3WHPxFxXwsBmYJ550OxbC4/mpHHN52RYTaAHHN7nECfpRP7srEQ
         4SOC9ZKuU+pRGoNmbVACe/CgzCt13+pLfBGkcEqHsVn5u2gBwx30Ireqt6Z5Yi51i4zq
         v1JkQ0ltXd2nE0jQ+bMOIAcfChQV8kt2wm75cHTbgSyccXM1jcD8VMX61T0IbJBP1hEV
         Rf3AxNIjFEnMX++5AsbT3xjzr8cHTCb4LILxkWd2/riqZLvzP1DvOwO0/fAhqkt1Ywy0
         T/XQ==
X-Gm-Message-State: APjAAAWgNERHYuc+WcrNn8ilgAgNNlRm6T6Vks+TiwCqwzjwXgL0mxbS
        xWqAF/eKrMrkgNGQjPdEYA==
X-Google-Smtp-Source: APXvYqzXSgF/c7kSEHBDaDU9mWHoTED/PKxAU/BIXyhy6IEOlSRWZJqsGNtigpquzLZZqkqhlM+RVw==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr130799oic.102.1556558878729;
        Mon, 29 Apr 2019 10:27:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y9sm13636043otk.20.2019.04.29.10.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 10:27:57 -0700 (PDT)
Date:   Mon, 29 Apr 2019 12:27:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        horms+renesas@verge.net.au, devicetree@vger.kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 4/4] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Message-ID: <20190429172757.GA22159@bogus>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  5 Apr 2019 14:44:09 +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
