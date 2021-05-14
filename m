Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DFD380740
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 12:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhENKfZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 06:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhENKfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 06:35:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 427F9613F2;
        Fri, 14 May 2021 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620988454;
        bh=MDt/JtauvGdhtTdBJNw3Sa4IR6v2OgRIZKcYn8oVayk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8aTy1tbQfDpZ7uXrHpa7HCbo1fIoAjSRcxrnWq3lEKXdjTc2IB5uZNK/G4dOKu8p
         J3uE96Z3FJq6IqrGZc8dE+CdUFLNDSHHJ+BlQzKuReoRzMo0s1enWugdLv2TvFdOSm
         4BokGU+PBQwOF02uYmnAlJQqUg9r6YYJ2kzEYqEVG6Hwq3y7hCnwgqRDrqv5CqBZs7
         ynvPF7j9HghkLRWFPaUfxBQEhxoEG/LD9Sn2ongrG9PaRZ4U63VPwwXkfLfA59pRbs
         5jaHbxUxYmXxrNQjMU6zWAZwW5szfdGVvgSf3/ldVDnomwyLNntCIVrNu3MeS/TQMo
         eLP/KvGOOVkjQ==
Date:   Fri, 14 May 2021 16:04:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: renesas,rcar-gen3-pcie-phy: Convert to
 json-schema
Message-ID: <YJ5SIqP2gIzbv/na@vkoul-mobl.Dlink>
References: <0301c3a7dae9afde115b6437a11c23ab85cb8b75.1620648490.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0301c3a7dae9afde115b6437a11c23ab85cb8b75.1620648490.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10-05-21, 14:10, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Gen3 PCIe PHY Device Tree binding
> documentation to json-schema.
> 
> Update the example to match reality.

Applied, thanks

-- 
~Vinod
