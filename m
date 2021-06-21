Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEC43AF21C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 19:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhFURmZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 13:42:25 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38442 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhFURmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:24 -0400
Received: by mail-oi1-f174.google.com with SMTP id q10so20719250oij.5;
        Mon, 21 Jun 2021 10:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=GOLlee18Cq+VZCrN2BSKn7jALbwR1Zc9vSp5DxBhXsc=;
        b=GaQkr8EvLGEka0ojbR35GP88QlPBNvY07ts1vyEkwFcchnhbA0boHvmzjnWGx+cMAH
         6rCM8TGCTAr5bTLAgMTAQ/GgT74RLocIS40BnlPQJvjlwccwCv7aKGchKD79FOy5cgH5
         kJ4ZUY2YvF72gQuWaVX/7BstDpXf4NMfEMi69V2ukZOx5WFVJYoL6CZ/DePkKGdTwUnt
         FvE7EMMD2de0RRhGThC1SNXDaUN8Q86ZpJX1ujzpT6Byoqr03Jj7BYARfM18bKx+2rLg
         J8PhM3e5f9sLXKAvR1tNkaJ8YG/LceSgFuADoTOrOI+QzeCqyQcYAfpwEIgPdCu2PiFu
         Ugkg==
X-Gm-Message-State: AOAM533mmDptJwUTJXakQYMmiNARIZcwMQp0gkOMo01oPU9paD7LQ6uy
        6U8aSKxNupMHHhWl7Tn4FQ==
X-Google-Smtp-Source: ABdhPJxfENLRerkLK7CZCNrrEAOulpIKYqd89FEg+Mrdo1plFtf4lh4tQqcgcpzZACnhF6rlmAMLLw==
X-Received: by 2002:aca:4d3:: with SMTP id 202mr17729526oie.9.1624297208354;
        Mon, 21 Jun 2021 10:40:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y13sm4184113ots.47.2021.06.21.10.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:07 -0700 (PDT)
Received: (nullmailer pid 1161632 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Tomohito Esaki <etom@igel.co.jp>
Cc:     linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20210621064403.26663-4-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp> <20210621064403.26663-4-etom@igel.co.jp>
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.341994.1161630.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Jun 2021 15:44:02 +0900, Tomohito Esaki wrote:
> Add device tree bindings documentation for virtual DRM.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/vdrm.yaml:39:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/vdrm.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 38, column 15
found a tab character that violates indentation
  in "<unicode string>", line 39, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/display/vdrm.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/vdrm.yaml:  while scanning a plain scalar
  in "<unicode string>", line 38, column 15
found a tab character that violates indentation
  in "<unicode string>", line 39, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/vdrm.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/display/vdrm.yaml
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494913

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

