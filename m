Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4EB1E68DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 19:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405658AbgE1Rub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 13:50:31 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44239 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405580AbgE1Ru3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 13:50:29 -0400
Received: by mail-io1-f68.google.com with SMTP id p20so17588638iop.11;
        Thu, 28 May 2020 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TPQiU9UZD0QCGydYcyf9Oph36s0ecW9luN+RtFrgCuU=;
        b=Uj8Vxj8clb5WmFBv5VHR8tr0OnO4sRBEoM4QmaJHQn2ZckLEbmUzWY1XijIoP+rIm8
         t+97tUD+451DDeJKco+G0niRK1F7MHiAY2Z9NNa519lEruDHzy3Mx3tjtHn6gcnVkwOK
         y8LY/5z+IUQkF137tfRyNa7nn9qw6WY9HYL16abFCHsczkTjuZNKmfx+XqWLTYlXaiYA
         D0VMzp8KkdRfLSdB5a9PmLAjy+d7FDCtFdLaidmGXVIJ6rStZrAqLhLcbVDQlcZLlL1w
         AnnzuUjuefEbOha9WWNjHMdGqgWx1XyrRbJOA13KTNYsealfTp56mw5qyIdZkeEqGbIm
         +HrA==
X-Gm-Message-State: AOAM533m76DdoYZDEqzBJBHdCut+sDx3TRcb8VRDwii3bxq633YKsVZ8
        LBnvzUP7ssSglVePe9wdJ4Z6+Ug=
X-Google-Smtp-Source: ABdhPJyF8cxzDw1wr6IvvmAgMfrH4AVUuJeZSVLXqFRWZnNTmB8zN2zxOx5/fbk7MU6lAfxss4nsDg==
X-Received: by 2002:a02:58c3:: with SMTP id f186mr3709201jab.120.1590688228923;
        Thu, 28 May 2020 10:50:28 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a13sm3561765ill.51.2020.05.28.10.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 10:50:28 -0700 (PDT)
Received: (nullmailer pid 390821 invoked by uid 1000);
        Thu, 28 May 2020 17:50:27 -0000
Date:   Thu, 28 May 2020 11:50:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1.2 4/4] dt-bindings: display: bridge: renesas, lvds:
 Convert binding to YAML
Message-ID: <20200528175027.GA390737@bogus>
References: <20200514213742.GO5955@pendragon.ideasonboard.com>
 <20200514214211.9036-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514214211.9036-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 15 May 2020 00:42:11 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes since v1:
> 
> - Mention RZ/G1 and R2/G2 explicitly
> - Drop the part numbers in comments, only keep the SoC names
> - Use one address and size cell in the examples
> ---
>  .../bindings/display/bridge/renesas,lvds.txt  |  85 ------
>  .../bindings/display/bridge/renesas,lvds.yaml | 248 ++++++++++++++++++
>  2 files changed, 248 insertions(+), 85 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
