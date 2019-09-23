Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB33BB32B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbfIWLxe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:53:34 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:59454 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfIWLxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:53:34 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D04B625AD69;
        Mon, 23 Sep 2019 21:53:30 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CF454944434; Mon, 23 Sep 2019 13:53:28 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:53:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to
 json-schema
Message-ID: <20190923115328.lpb5qeu6poacrb6y@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
 <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
 <20190919151014.4azdfh2feg5ot6no@verge.net.au>
 <CAL_Jsq+y5o-jBX9emVpW+q7n+Tde2ON0TqHmm9gFj7emUURL7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+y5o-jBX9emVpW+q7n+Tde2ON0TqHmm9gFj7emUURL7Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 19, 2019 at 02:33:58PM -0500, Rob Herring wrote:
> On Thu, Sep 19, 2019 at 10:10 AM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Tue, Sep 17, 2019 at 07:12:16AM -0500, Rob Herring wrote:
> > > On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
> > > <horms+renesas@verge.net.au> wrote:

...

> > > > +
> > > > +  power-domains:
> > > > +    # Required if clocks is absent, optional otherwise
> > > > +    minItems: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - '#address-cells'
> > > > +  - '#size-cells'
> > > > +  - ranges
> > >
> > > This will capture what you commented above:
> > >
> > > oneOf:
> > >   - required:
> > >       - clocks
> > >   - required:
> > >       - power-domains
> >
> > Thanks. Unfortunately dtbs_check does not seem happy
> > if both clocks and power-domains are present.
> 
> I was thinking it was either or. Use 'anyOf' instead.

Thanks, perhaps the tooling needs updating to handle this.

I now have:

required:
  - compatible
  - '#address-cells'
  - '#size-cells'
  - ranges

anyOf:
  - required:
      - clocks
  - required:
      - power-domains

And see:

# cr make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
...

Traceback (most recent call last):
  File "/usr/local/lib/python3.7/dist-packages/dtschema/lib.py", line 429, in process_schema
    DTValidator.check_schema(schema)
  File "/usr/local/lib/python3.7/dist-packages/dtschema/lib.py", line 575, in check_schema
    raise jsonschema.SchemaError.create_from(error)
jsonschema.exceptions.SchemaError: Additional properties are not allowed ('anyOf' was unexpected)

Failed validating 'additionalProperties' in metaschema['allOf'][0]:
    {'$id': 'http://devicetree.org/meta-schemas/base.yaml#',
     '$schema': 'http://json-schema.org/draft-07/schema#',
     'additionalProperties': False,
     'allOf': [{'$ref': 'http://json-schema.org/draft-07/schema#'}],
     'description': 'Metaschema for devicetree binding documentation',
     'properties': {'$id': {'pattern': 'http://devicetree.org/schemas/.*\\.yaml#'},
                    '$schema': {'enum': ['http://devicetree.org/meta-schemas/core.yaml#',
                                         'http://devicetree.org/meta-schemas/base.yaml#']},
                    'additionalProperties': {'type': 'boolean'},
                    'allOf': {'items': {'propertyNames': {'enum': ['$ref',
                                                                   'if',
                                                                   'then',
                                                                   'else']}}},
                    'definitions': True,
                    'dependencies': True,
                    'description': True,
                    'else': True,
                    'examples': {'items': {'type': 'string'},
                                 'type': 'array'},
                    'if': True,
                    'maintainers': {'items': {'format': 'email',
                                              'type': 'string'},
                                    'type': 'array'},
                    'oneOf': True,
                    'patternProperties': True,
                    'properties': True,
                    'required': True,
                    'select': {'allOf': [{'$ref': 'http://json-schema.org/draft-07/schema#'},
                                         {'oneOf': [{'properties': {'properties': True,
                                                                    'required': True},
                                                     'type': 'object'},
                                                    {'type': 'boolean'}]}]},
                    'then': True,
                    'title': {'maxLength': 100},
                    'unevaluatedProperties': {'type': 'boolean'}},
     'required': ['$id', '$schema', 'title', 'maintainers']}

On schema:
    {'$id': 'http://devicetree.org/schemas/bus/simple-pm-bus.yaml#',
     '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
     'anyOf': [{'required': ['clocks']}, {'required': ['power-domains']}],
     'description': 'A Simple Power-Managed Bus is a transparent bus that '
                    "doesn't need a real\n"
                    "driver, as it's typically initialized by the boot "
                    'loader.\n'
                    '\n'
                    'However, its bus controller is part of a PM domain, '
                    'or under the control\n'
                    "of a functional clock.  Hence, the bus controller's "
                    'PM domain and/or\n'
                    'clock must be enabled for child devices connected to '
                    'the bus (either\n'
                    'on-SoC or externally) to function.\n'
                    '\n'
                    'While "simple-pm-bus" follows the "simple-bus" set of '
                    'properties, as\n'
                    'specified in the Devicetree Specification, it is not '
                    'an extension of\n'
                    '"simple-bus".\n',
     'examples': ['#include <dt-bindings/clock/qcom,gcc-msm8996.h>\n'
                  '#include <dt-bindings/interrupt-controller/irq.h>\n'
                  '\n'
                  'bus@0 {\n'
                  '    power-domains = <&gcc AGGRE0_NOC_GDSC>;\n'
                  '    compatible = "simple-pm-bus";\n'
                  '    #address-cells = <1>;\n'
                  '    #size-cells = <1>;\n'
                  '    ranges;\n'
                  '};\n'],
     'maintainers': ['Geert Uytterhoeven <geert+renesas@glider.be>'],
     'properties': {'#address-cells': {'const': 1},
                    '#size-cells': {'enum': [1, 2]},
                    '$nodename': {'pattern': '^bus@[0-9a-f]+$'},
                    'clocks': True,
                    'compatible': {'contains': {'const': 'simple-pm-bus'},
                                   'description': 'Shall contain '
                                                  '"simple-pm-bus" in '
                                                  'addition to a optional '
                                                  'bus-specific compatible '
                                                  'strings defined in '
                                                  'individual pm-bus '
                                                  'bindings.'},
                    'power-domains': {'minItems': 1},
                    'ranges': True},
     'required': ['compatible', '#address-cells', '#size-cells', 'ranges'],
     'title': 'Simple Power-Managed Bus'}

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-mk-schema", line 32, in <module>
    schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
  File "/usr/local/lib/python3.7/dist-packages/dtschema/lib.py", line 470, in process_schemas
    sch = process_schema(os.path.abspath(filename))
  File "/usr/local/lib/python3.7/dist-packages/dtschema/lib.py", line 431, in process_schema
    print(filename + ": ignoring, error in schema '%s'" % exc.path[-1])
IndexError: deque index out of range
