Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7D751D067
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 22:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfENURP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 16:17:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36983 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfENURP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 16:17:15 -0400
Received: by mail-oi1-f196.google.com with SMTP id f4so106100oib.4;
        Tue, 14 May 2019 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vCIo0PtXohxKjB0d7BJFUlaniBQb1hXlIxL8AXnKx2s=;
        b=uQxCUp6qCAnbP0LaPEe7DBmr24q0hQ25b6tG6y9/sGc256kAyZor18SqBilWYfGSAD
         PrP12M/a/uegOWeUpvpBaDxWvU2a3FmLWLy8X0CrL8OHBOrQWtK+g1tY1EsYbimfZhQt
         tYNh5Bu34LvALWhhUARY6y8VZuD3pFqFcGzDxoGvOhyrNsMxBPbBefbz5bJiZY7rTVQl
         U05ziQztiHP48muHkjohxRcZ3LUonmogCar08BLMguAAmHMcQhLy3iU5TNISz43JEXrg
         AtyA9gPWyiw6JXfjbEGqy8wtKQ88ZzDM143fxMfU82DOxj9bWLRlACOE5qIE5Be1gVHJ
         4eSw==
X-Gm-Message-State: APjAAAVkMo0f+ZHTpJJvQzzB+QYwSxj4ZnY+sqGolVYTaPkS+jNsujJF
        jIV+1kHl+BJ1WqSaLpafaw==
X-Google-Smtp-Source: APXvYqxlzufSIdi94CYyBDo86DA3MUke7A1hx6ju2bPmafSngpVcnhTslU8xbt70Z6gVCOZxeByWsg==
X-Received: by 2002:aca:6086:: with SMTP id u128mr44867oib.79.1557865033944;
        Tue, 14 May 2019 13:17:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c24sm1979892otm.75.2019.05.14.13.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 13:17:13 -0700 (PDT)
Date:   Tue, 14 May 2019 15:17:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190514201712.GA1742@bogus>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 12 May 2019 00:06:54 +0300, Laurent Pinchart wrote:
> The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> dual-link. In dual-link mode both input ports are used to carry even-
> and odd-numbered pixels separately. Document this in the DT bindings,
> along with the related rules governing port and usage.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
