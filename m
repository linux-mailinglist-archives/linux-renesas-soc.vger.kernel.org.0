Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9752A6D71
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 20:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgKDTEo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 14:04:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35108 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgKDTEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 14:04:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id n11so20345430ota.2;
        Wed, 04 Nov 2020 11:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7I4Ava00xHdhJtO3UlyADm3vNZtn+VRgADj5UlnLDao=;
        b=VnEMajPHnfTmO/tkUxxeE9uZ3CdUTgeHtt+84oyAt7XB3jI+BDxjV4mdfr5MM8kDpW
         mBMjZSqheLmSgKoiQTf1ELKwt9GPoZ+LxAtU8HznVxzLLIAy59s33cLsoK0AKHAr093u
         7cOp4KRgh0NJol6sdfndqqQNrGImxwzaV3Qru9XorkxltX+QHYF7WGOBshq9Iai9XIgV
         yewYhe5Dz6COXhkoquI/BvbQwFcXIQlx2GYLxb6fH0yb2ocbBoA3n024agoRERVHaWmy
         LZmdor4P6AMU68iGyxA14d4nKYWqaZdlfKvYAO3jXOvQeTvw6DYfuYsDh03kfH0RDu+f
         u5Ag==
X-Gm-Message-State: AOAM531/Umu63ezzld+2kMVDRxg1oLkWUIBapZy6Pb/S62vSMdP4+k/l
        dwmjOnuhLHiKp7z/R4DRAt2FZd0qpg==
X-Google-Smtp-Source: ABdhPJzQ8ZznaslqnLk24xyY+Hv42Y9DhhSILH5m9qKCLuQNRjhU+wW39YkpyMt7b8oR4nXAStvAMw==
X-Received: by 2002:a9d:6419:: with SMTP id h25mr20253654otl.79.1604516683215;
        Wed, 04 Nov 2020 11:04:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n128sm634671oif.4.2020.11.04.11.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:04:42 -0800 (PST)
Received: (nullmailer pid 3957943 invoked by uid 1000);
        Wed, 04 Nov 2020 19:04:41 -0000
Date:   Wed, 4 Nov 2020 13:04:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Convert bindings to json-schema
Message-ID: <20201104190441.GB3957380@bogus>
References: <1604475005-29495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604475005-29495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 04 Nov 2020 16:30:05 +0900, Yoshihiro Shimoda wrote:
> Convert Renesas R-Car USB 2.0 clock selector bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 --------------
>  .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++++++++++
>  2 files changed, 100 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml


See https://patchwork.ozlabs.org/patch/1393687

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

