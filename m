Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7252E8241
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Dec 2020 23:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgLaWlo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Dec 2020 17:41:44 -0500
Received: from mail-io1-f41.google.com ([209.85.166.41]:39827 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgLaWlo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Dec 2020 17:41:44 -0500
Received: by mail-io1-f41.google.com with SMTP id d9so18144488iob.6;
        Thu, 31 Dec 2020 14:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bq1ampSovDf3E6K/Nut0jgcMzqjMGTsUaPGA2BE/HFs=;
        b=AmPKoUO94GmrCn1vkl9nqFKLLODjE9XLAaLYjmR7m+YDGDd7LMWB57TPqoq8e/qeu6
         +UsSc1cHlXSlHHEJv+G+i+cEXlPrgQIM7J752pxq3IVo9Xabxm+22+Zkc9p5ofyp/1gy
         Bj0qCDRWzklqqmu8YAg6W2XLuCR3k/G5D+G15bkJCHGNXiAEcYqX5Jgd2jSdm2eZiirJ
         Psn42K/6qXrRzIDqb/tlLSatmPxYbO6HRIhL4ocJolTHzKQYhKU/x+D0AsJLg3Q+1hQ0
         weZEsSWjup5pvyixNtQQe2rPiz9y/akpUg7ZZJP3sgnGYiFFOlABMu0BZagUs8QBHJiH
         ExvA==
X-Gm-Message-State: AOAM530YMonjH9qWQg5a4vi8AHmjT4PXb71GJtTGABfrQSfaItgGF65T
        yBgVdL2n3or/S0pA66RoXP9H3u0n8A==
X-Google-Smtp-Source: ABdhPJx/IhyHgtSG6AFYHM9hSUmuPDlCR3dmePMBnSOqOxfvDdMCLvCvyfiIB/FtB12UbDksCb5c/Q==
X-Received: by 2002:a05:6638:1a:: with SMTP id z26mr50695001jao.52.1609454463235;
        Thu, 31 Dec 2020 14:41:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y3sm34534058ilq.9.2020.12.31.14.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 14:41:02 -0800 (PST)
Received: (nullmailer pid 2508944 invoked by uid 1000);
        Thu, 31 Dec 2020 22:41:00 -0000
Date:   Thu, 31 Dec 2020 15:41:00 -0700
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] dt-bindings: display: renesas,du: Convert binding to
 YAML
Message-ID: <20201231224100.GA2508888@robh.at.kernel.org>
References: <20201220145053.7382-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201220145053.7382-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Dec 2020 16:50:53 +0200, Laurent Pinchart wrote:
> Convert the Renesas R-Car DU text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Drop boilerplate for ports node
> - Add description for interrupts peroperty
> - Use single quoted strings to avoid double backslashes
> 
> Changes since v1:
> 
> - Use pattern instead of enum for dclkin
> - Update MAINTAINERS
> ---
>  .../bindings/display/renesas,du.txt           | 145 ---
>  .../bindings/display/renesas,du.yaml          | 831 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 832 insertions(+), 146 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/renesas,du.txt
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,du.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
